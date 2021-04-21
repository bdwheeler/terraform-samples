# Morpheus Option Type Configs

## AWS Accounts

### Option Lists

| Name        | AWS Accounts |
|-------------|--------------|
| TYPE        | Morpheus API |
| Option List | Clouds       |                                                                                                                                                                        

Translation Script 
```javascript
//Grab AWS Clouds and Push Values 
for (var x = 0; x < data.length; x++) {   
    if (data[x].zoneType.code == "amazon") {
         results.push({name:data[x].name, value:data[x].id});   
    } 
}
```

| Name | AWS Regions |
|------|-------------|
| TYPE | Manual      |

DATASET
```
'us-east-1','us-east-1'
'us-east-2','us-east-2'
'us-west-1','us-west-1'
'us-west-2','us-west-2'
```


| Name | Subnet CIDR |
|------|-------------|
| TYPE | Manual      |

DATASET
```
'/24','24'
'/25','25'
'/26','26'
'/27','27'
'/28','28'
'/29','29'
'/30','30'
'/31','31'
'/32','32'
```

### Option Types

| Name        | AWS Account    |
|-------------|----------------|
| Field Name  | awsAccount     |
| Type        | Select List    |
| Label       | Select Account |
| Option List | AWS Accounts   |

| Name        | Region        |
|-------------|---------------|
| Field Name  | awsRegion     |
| Type        | Select List   |
| Label       | Select Region |
| Option List | AWS Regions   |

| Name        | CIDR Mask     |
|-------------|---------------|
| Field Name  | cidrMask      |
| Type        | Select List   |
| Label       | Subnet CIDR   |
| Option List | Subnet CIDR   |

| Name        | Subnet Count  |
|-------------|---------------|
| Field Name  | subnetCount   |
| Type        | Number        |
| Label       | Subnet Count  |