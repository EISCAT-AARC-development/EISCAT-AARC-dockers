<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

$metadata['https://portal.eiscat-aarc.local/shibboleth'] = array (
  'entityid' => 'https://portal.eiscat-aarc.local/shibboleth',
  'description' => 
  array (
    'en' => 'EISCAT Scientific Association',
  ),
  'OrganizationName' => 
  array (
    'en' => 'EISCAT Scientific Association',
  ),
  'name' => 
  array (
    'en' => 'EISCAT portal',
  ),
  'OrganizationDisplayName' => 
  array (
    'en' => 'EISCAT',
  ),
  'url' => 
  array (
    'en' => 'https://www.eiscat.se',
  ),
  'OrganizationURL' => 
  array (
    'en' => 'https://www.eiscat.se',
  ),
  'contacts' => 
  array (
    0 => 
    array (
      'contactType' => 'technical',
      'givenName' => 'John',
      'surName' => 'Doe',
      'emailAddress' => 
      array (
        0 => 'mailto:john.doe@domain.tld',
      ),
    ),
  ),
  'metadata-set' => 'saml20-sp-remote',
  'AssertionConsumerService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SAML2/POST',
      'index' => 1,
    ),
    1 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST-SimpleSign',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SAML2/POST-SimpleSign',
      'index' => 2,
    ),
    2 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SAML2/Artifact',
      'index' => 3,
    ),
    3 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:PAOS',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SAML2/ECP',
      'index' => 4,
    ),
    4 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:1.0:profiles:browser-post',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SAML/POST',
      'index' => 5,
    ),
    5 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:1.0:profiles:artifact-01',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SAML/Artifact',
      'index' => 6,
    ),
  ),
  'SingleLogoutService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:SOAP',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SLO/SOAP',
    ),
    1 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SLO/Redirect',
    ),
    2 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SLO/POST',
    ),
    3 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact',
      'Location' => 'https://portal.eiscat-aarc.local/Shibboleth.sso/SLO/Artifact',
    ),
  ),
  'keys' => 
  array (
    0 => 
    array (
      'encryption' => true,
      'signing' => true,
      'type' => 'X509Certificate',
      'X509Certificate' => 'MIIDPDCCAiSgAwIBAgIJAPQTYpsdcpiXMA0GCSqGSIb3DQEBBQUAMCMxITAfBgNV
BAMTGHBvcnRhbC5laXNjYXQtYWFyYy5sb2NhbDAeFw0xODExMDUxNTM3MjJaFw0y
ODExMDQxNTM3MjJaMCMxITAfBgNVBAMTGHBvcnRhbC5laXNjYXQtYWFyYy5sb2Nh
bDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANLvd/PmgmsQ4+L0+FUI
L89neCjwAljrTII3X0C1od3Zfryx3obgKIhLSTX87LB2fDwRqeltyd1gOEAGjQN2
qUCrKkYKbdvHWaG71nA0u1sGUGmx77EGgWR27LSUcDzzCQshCl18GGDiRfPMQYdl
oFQsSmOu8XpIFq8wRn1N+3kzfdePRvnlUBQy//19aOAozcnR0bjuyHEDb4ngWuZx
o4/s58RuJc4IEY/5sMI+dmR+kKpnzyrMOuyQ00Osgadi1GyQVhdjKpIktzfIcK8l
NKaH3YMGepqnVs0c3G9ZYpbIvh6e6SyOs4lcSKWCOl1OdnNI3aU71Iio7pvB4TGd
QI0CAwEAAaNzMHEwUAYDVR0RBEkwR4IYcG9ydGFsLmVpc2NhdC1hYXJjLmxvY2Fs
hitodHRwczovL3BvcnRhbC5laXNjYXQtYWFyYy5sb2NhbC9zaGliYm9sZXRoMB0G
A1UdDgQWBBSAFltCgk++KpKIv7DFKRLUdSRH0DANBgkqhkiG9w0BAQUFAAOCAQEA
IcUksGLUMHziLQsV6WAJxqZ2JbI6/2hGvIgaZ73xcIQ6Pnqux91Ju0MXvPBvV8OQ
JRsKRd4xHO7434/wH9iE2QAj+z27Ii6kYjtljoW96I0yyh0PLotCWyr/dhIQrU0/
os2bOQD4LgJyMiQQsUajplA5OAb09bkMiN3McWMDlKojcGUTsnM+fDG9+89Cq0l6
5mfQpNym/X+W7uEUY8+jm4sU0wRYVhugaZ/vJU6uvwE58DMI7J8H7i5cNbSt1v+Z
250sATTh0GqYKzrb5oOX/1jlHl7BXvokPWZ7fb4Rk4Nt/kjLMMxb5bURMLkXxzmw
eN9aE3+mRIF4J9K/dNGtLw==
',
    ),
  ),
  'UIInfo' => 
  array (
    'DisplayName' => 
    array (
      'en' => 'EISCAT portal',
    ),
    'Description' => 
    array (
      'en' => 'The EISCAT portal is operated by the EISCAT Scientific Association to provide access to datasets for its researchers and partners',
    ),
    'InformationURL' => 
    array (
      'en' => 'https://www.eiscat.se',
    ),
    'PrivacyStatementURL' => 
    array (
    ),
    'Logo' => 
    array (
      0 => 
      array (
        'url' => 'https://www.eiscat.se/wp-content/uploads/2017/06/EISCAT-logo-fat-300.png',
        'height' => 300,
        'width' => 300,
      ),
    ),
  ),
);

