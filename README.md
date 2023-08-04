# Tea Time ☕

## Documentation 

Here you have documentation of all available API functions. To get started you can make sample request


### Subscribe to Tea Subscription
**create a new subscription**

`POST http://localhost3000/api/v0/customer/subscribe`

**Headers**
Response Headers:
  - `Content-Type: application/json`

**QUERY Parameters**

| Name | Type | Example | Description |
| ----------- | ----------- | ----------- | ----------- | 
| **customer_id** | number | 3 | customer's id |
| **tea_id** | number | 6 | tea's id |

**Optional Parameters**

| Name | Type | Example | Description |
| ----------- | ----------- | ----------- | ----------- | 
| **frequency** | string | 'weekly', 'monthly', 'seasonal' | how often |
| **status** | string | 'active', 'cancelled' | status of subscription |

**Example Request & Response**
`POST` `http://localhost:3000/api/v0/customer/subscribe?customer_id=3&tea_id=6`

```
{
    "data": {
        "id": "20",
        "type": "subscription",
        "attributes": {
            "title": "Sleepytime Tea",
            "price": 49.56,
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```
