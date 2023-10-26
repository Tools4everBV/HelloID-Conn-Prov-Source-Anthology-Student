# HelloID-Conn-Prov-Source-Anthology-Student

| :information_source: Information |
|:---------------------------|
| This repository contains the connector and configuration code only. The implementer is responsible to acquire the connection details such as username, password, certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements.       |
<br />
<p align="center"> 
  <img src="https://www.tools4ever.nl/connector-logos/anthologystudent-logo.png" width="300">
</p>
<br />
HelloID Provisioning Source Connector for Anthology Student

<!-- TABLE OF CONTENTS -->
## Table of Contents
* [Getting Started](#getting-started)
* [Requirements](#requirements)
* [Configure API Access](#configure-api-access)

<!-- GETTING STARTED -->
## Getting Started
By using this connector you will have the ability to import data into HelloID:
* Student Demographics

## Requirements
* API Access

## Configure API Access
To configure Key Based Authentication, please follow these steps
* Location - Select Settings > System > Application API Keys
    * [Product Help Link](https://help.campusmanagement.com/CNS/23.0/WebClient/Content/SU/System/ApplicationAPIKey/p_AddApplicationAPIKey.htm?cshid=CNSp_AddApplicationAPIKey)

![image](https://github.com/Tools4everBV/HelloID-Conn-Prov-Source-Anthology-Student/assets/24281600/3a07a6d9-f860-4156-8827-dd74ac57b6f1)
![image](https://github.com/Tools4everBV/HelloID-Conn-Prov-Source-Anthology-Student/assets/24281600/0331c3a3-5faf-4789-9798-1afa9a52a3fd)

* Encode the Application Key with Base64. Encode the value and share it with client/vendor
    * CallingAppName: Calling Application Name
    * KeyValue: Application Key

`{"CallingAppName":"DualEnrollAPI","KeyValue":"YsIQkq2Hj/viKSM5Lzn07Q=="}`

![image](https://github.com/Tools4everBV/HelloID-Conn-Prov-Source-Anthology-Student/assets/24281600/7000a276-172c-4d40-ab3a-3ab9b534005b)
![image](https://github.com/Tools4everBV/HelloID-Conn-Prov-Source-Anthology-Student/assets/24281600/13b26604-77c8-4e01-8b37-390b18b22a75)




## Setup the PowerShell connector
1. Add a new 'Source System' to HelloID and make sure to import all the necessary files.

    - [ ] configuration.json
    - [ ] persons.ps1
    - [ ] departments.ps1


2. Fill in the required fields on the 'Configuration' tab.
* Base URI
    * URI of Instance
* Application Key
    * API Key
* Page Size
    * Size of Results to pull back per page
* Student Fields
    * Fields to pull from Student Endpoint
* Include Statuses
    * Student Statuses to include in HelloID Import (no value results in all statuses)
* Exclude Shifts
    * Shifts to exclude from Import (no value results no filtering of shifts)


# HelloID Docs
The official HelloID documentation can be found at: https://docs.helloid.com/
