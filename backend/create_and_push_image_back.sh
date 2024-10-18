#!/usr/bin/env bash
docker build -t pepesan/awscds_backend:latest .
docker login
docker push pepesan/awscds_backend:latest
