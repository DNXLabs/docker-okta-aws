# Okta SSO with AWS STS

### Docker-Compose
Using docker-compose:

```yaml
  okta-auth:
    image: dnxsolutions/aws-okta-auth:0.0.1
    volumes:
      - ./.env.auth:/work/.env
    environment:
      - OKTA_ORG
      - OKTA_AWS_APP_URL
      - OKTA_AWS_DEFAULT_REGION
```

And run `docker-compose run okta` to be prompted with username and password.

### Environment Variables
Here are some quick environment variables to get you started:

- `OKTA_ORG` - Name of your organisation in Okta settings. Must be set.
- `OKTA_AWS_APP_URL` - Your unique application URL. Must be set.
- `OKTA_AWS_ROLE_TO_ASSUME` - The initial role to assume if found, otherwise will prompt  with list (default: '')
- `OKTA_AWS_DEFAULT_REGION` - The region your Okta login is to take place in (default: 'ap-southeast-2')
- `OKTA_USERNAME` - Your personal Okta username, if not set will be prompted to enter in manually
- `OKTA_AWS_PROFILE` - Custom name for the okta profile to use (default: 'default')

## Build
Update the `OKTA_VERSION` in both `Makefile` and `Dockerfile`. Then run:

    make build

Docker Hub will automatically trigger a new build.