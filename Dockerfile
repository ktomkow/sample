FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
COPY . .
RUN dotnet publish -c Release sample.sln -o out
# image

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
# standard entrypoint not used
# ENTRYPOINT [ "dotnet", "Crumbs.Api.dll" ]
# We will use this one with parametrized PORT
CMD ASPNETCORE_URLS=http://*:$PORT dotnet web.dll