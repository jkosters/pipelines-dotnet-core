# This Dockerfile demonstrates how to use Docker to create an image
# after a build is produced and tested by Azure Pipelines
# See http://docs.microsoft.com/azure/devops/pipelines/languages/docker for more information

# Create a container with the compiled asp.net core app
FROM microsoft/aspnetcore:2.0 AS base
# Create src directory
WORKDIR /src
COPY dotnetcore-sample/out .

FROM microsoft/aspnetcore:2.0 AS final
# Create app directory
WORKDIR /app
COPY --from=base /src .




# Copy files from the artifact staging folder on agent
COPY dotnetcore-sample/out .

ENTRYPOINT ["dotnet", "dotnetcore-sample.dll"]
