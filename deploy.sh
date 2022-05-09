sam package --template-file ./cloudformation/template.yaml \
--output-template-file ./cloudformation/packaged.yaml  \
--s3-bucket developer-portal-deployment-files


sam deploy \
--template-file ./cloudformation/packaged.yaml \
--stack-name "nva-portal" \
--s3-bucket developer-portal-deployment-files \
--capabilities CAPABILITY_NAMED_IAM \
--parameter-overrides  \
DevPortalAdminEmail="<some email>" \
CognitoDomainNameOrPrefix="<ENV>-portal-login" \
CustomDomainName="portal.<ENV>.nva.aws.unit.no" \
CustomDomainNameAcmCertArn="<ACCOUNT_CERTFICATE_ARN>" \
ArtifactsS3BucketName="dev-portal-artifacts-<ACCOUNT_NUMBER>" \
DevPortalSiteS3BucketName="dev-portal-site-<ACCOUNT_NUMBER>"
