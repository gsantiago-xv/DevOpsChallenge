FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
RUN mkdir /app
COPY src /app/src
WORKDIR /app
RUN cd src/MyWebApp \ 
&& dotnet restore MyWebApp.csproj \
&& cd ../ \
&& dotnet build MyWebApp.sln -o /app/publish
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
ENV ASPNETCORE_ENVIRONMENT="Development"
WORKDIR /app
COPY --from=build /app/publish /app/
EXPOSE 80
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
