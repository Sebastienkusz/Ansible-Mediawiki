#!/bin/bash

az vm user update \
    --resource-group b1e3-gr2 \
    --name http1 \
    --username sebastien \
    --ssh-key-value ~/.ssh/sebastien_rsa.pub

az vm user update \
    --resource-group b1e3-gr2 \
    --name bdd1 \
    --username sebastien \
    --ssh-key-value ~/.ssh/sebastien_rsa.pub