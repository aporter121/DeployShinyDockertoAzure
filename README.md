# DeployShinyDockertoAzure

testing approaches for github release to Azure web app.

This creates a docker container - using Rocker's shiny server container, it adds a few R packages. Then the deployment scripts create the container to deploy to Azure Web Apps.

The benefit of azure web apps - scaling, balancing, and authentication are managed by Azure. A virtual machine will probably be cheaper and more flexible, but requires a bit more admin. 

Basically following this guide:
https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-azure/deploying-docker-to-azure-app-service

Requires a few configurations of secrets on both the github and azure side - info in the link above.

When deployed to Azure, I mount an Azure file share to /srv/shiny-server/apps - this mounts the files in website.com/apps
I can then let users deploy their apps to the azure file share.
