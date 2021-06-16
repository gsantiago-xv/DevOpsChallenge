FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src/MyWebApp
COPY ["MyWebApp.csproj", ""]
RUN dotnet restore "./MyWebApp.csproj"
COPY . .
WORKDIR "/src/MyWebApp/."
RUN dotnet build "MyWebApp.csproj" -c Release -o /app/Build

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
RUN dotnet publish "MyWebApp.csproj" -c Releasev -o /app/publish  

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
