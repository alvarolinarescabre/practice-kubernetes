#!/bin/bash

helm install chamo-demo-joomla --set joomlaUsername=admin,joomlaPassword=CiCeSuperPassword,mariadb.mariadbRootPassword=CiCeSuperPassword bitnami/joomla
