# Companies

The company corresponds to the domain of the store. If the user logs in to [http://nala.se](http://nala.se),
the multitenant system will map that domain to the company table and fetches all the configuration. It also supports a custom domain to which Fisherline will fetch the data for.

## Properties

The following information belongs to the company:

Field  | Description | Type | Example
------ | ------------ | --- | ---
id | Id of the company | integer | `1001`
name | Name of the company | string | `Nala store`
subdomain | Subdomain | string | `nala.fisherline.co`
custom_domain | Custom domain of the website | string | `store.nala.se`
is_offline | The website is offline | boolean | `true|false`
is_active | Is the store active | boolean | `true|false`

## Multi tenancy

We have two scenarios in which the user navigates to:

- In a subdomain:

  http://nala.fisherline.co

  The system will parse the subdomain `nala`, lookup the name in the `core.companies` table, fetch the configuration and connect to the appropriate database using the company ID (`1001`).

- In a custom domain like:

  http://www.nala.se

  The system will strip the `www` part and match `nala.se`, in this case it will perform the same lookup but using the full domain name.

- In a domain like:

  http://store.nala.se

  In this case it doesn't strip anything but uses the full domain to perform the lookup `store.nala.se`

`http://` or `https://` are not considered in the lookup.