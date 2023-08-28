#!/bin/bash

helm install chamo-demo-joomla --set joomlaUsername=admin,joomlaPassword=SecretSuperPassword,mariadb.mariadbRootPassword=SecretSuperPassword bitnami/joomla
