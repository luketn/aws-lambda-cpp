# aws-lambda-cpp
A C++ AWS Lambda implementation which implements the bootstrap specification for Lambda. 

## Serverless

The project is deployed to AWS using Serverless:  
https://www.serverless.com/

Refer to the AWS guide for settings:
https://www.serverless.com/framework/docs/providers/aws/guide/serverless.yml/

Tried several load tests of the solution, and found that 1024MB RAM gave the sweet spot of performance to price.  
Less than 1024MB we found slower cold starts in th 2s+ range. Adding more RAM did not improve performance.

## Lambda
Specification:  
https://docs.aws.amazon.com/lambda/latest/dg/lambda-dg.pdf
