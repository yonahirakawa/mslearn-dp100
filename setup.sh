#! /usr/bin/sh

# Create workspace
echo "Create a resource group:"
az group create --name "rg-dp100-labs" --location "eastus"

echo "Create an Azure Machine Learning workspace:"
az ml workspace create --name "mlw-dp100-labs" -g "rg-dp100-labs"

# Create compute instance
RANDOM=$$

ComputeName="ci${RANDOM}"

echo "Creating a compute instance with name: " $ComputeName
az ml compute create --name ${ComputeName} --size STANDARD_DS11_V2 --type ComputeInstance -w mlw-dp100-labs -g rg-dp100-labs
