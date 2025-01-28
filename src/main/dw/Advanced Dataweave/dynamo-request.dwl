%dw 2.0
output application/json
import * from dw::core::Periods

var noOfDays = Mule::p('aws.dynamoDB.defaultExpirationDays')

var defaultExpirationDateStart = now() as Date - period({
	days: noOfDays as Number
})
var defaultExpirationDateEnd = now() as Date - period({
	days: (noOfDays  as Number) +2
})
---
{
  tableName: Mule::p('aws.dynamoDB.someTableName'),
  indexName: Mule::p('aws.dynamoDB.someIdCreationDateTimeIndex'),
  pageSize: attributes.queryParams.pageSize default Mule::p('aws.dynamoDB.queryOperation.pageSize'),
  keyConditionExpression: "#some_id = :some_id",
  expressionAttributeNames: {
    "#some_id": "someId",
    "#mulesoft_status": "status",
    "#type" : "type"
  },
  expressionAttributeValues: {
    ":some_id": {
      "S": attributes.uriParams.'someId'
    },
    ":mulesoft_status": {
      "S": attributes.queryParams.excludeStatus default "some_SUBMITTED"
    },
    ":type": {
      "S": attributes.queryParams.excludeType default "notification"
    }
  },
  filterExpression: "#mulesoft_status <> :mulesoft_status AND #type <> :type",
  exclusiveStartKey: {
    "transactionCorrelationId": {
      "S": attributes.queryParams.lastTransactionCorrelationId default ""
    },
    "creationDateTime": {
      "S": attributes.queryParams.lastCreationDateTime default ""
    },
    "someId": {
      "S": attributes.queryParams.lastsomeId default ""
    },
  }
}


%dw 2.0
output application/json
---
((((payload.items map {
    ($ mapObject (value,key,index) -> { (key) : ((value pluck ($)) filter $ != null)[0]})
})) orderBy ($.creationDatetime))[-1 to 0])[0]
