# Automata

Automata - is a set of useful automation tools,
scripts and presets for Debian based systems with
amd64 architecture. These tools mostly were
developed for VPS and cloud.

## Content:

- ### Ansible playbooks
- ### Terraform presets
- ### Configs
- ### Dockerfiles
- ### CI / CD pipelines

## Playbooks:

### Deployments:

| Playbook                                                   | Category | Description                                                                                                                     |
|------------------------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------|
| [PostgreSQL](playbooks/deployments/docker/postgresql.yaml) | Docker   | Deploys PostgreSQL database and exposes :5432                                                                                   |
| [Redis](playbooks/deployments/docker/redis.yaml)           | Docker   | Deploys Redis and exposes :6379                                                                                                 |
| [Minio](playbooks/deployments/docker/minio.yaml)           | Docker   | Deploys MinIO and exposes :9000 and :9001 for management                                                                        |
| [RabbitMQ](playbooks/deployments/docker/rabbitmq.yaml)     | Docker   | Deploys RabbitMQ and exposes :5672 and :15672 for management                                                                    |
| [Loki](playbooks/deployments/docker/loki_stack.yaml)       | Docker   | Deploys a dev-ready loki logs management stack, includes Grafana dashboard, ports are :3100 for loki agent, :3000 for dashboard |

| Playbook                                                      | Category   | Description                                          |
|---------------------------------------------------------------|------------|------------------------------------------------------|
| [Cluster](playbooks/deployments/k8s/cluster.yaml)             | Kubernetes | Deploys and exposes a single-node cluster using Kind |
| [Metrics](playbooks/deployments/k8s/metrics.yaml)             | Kubernetes | Deploys metrics server for your cluster              |
| [Nginx Ingress](playbooks/deployments/k8s/nginx_ingress.yaml) | Kubernetes | Deploys Nginx-Ingress for your cluster               |
| [ArgoCD](playbooks/deployments/k8s/argocd.yaml)               | Kubernetes | Deploys ArgoCD for your cluster                      |
| [Vault](playbooks/deployments/k8s/vault.yaml)                 | Kubernetes | Deploys Hashicorp Vault for your cluster             |

### Packages:

| Playbook                                                   | Description                           |
|------------------------------------------------------------|---------------------------------------|
| [Install package](playbooks/packages/install_apt.yaml)     | Installs provided apt packages        |
| [Update packages](playbooks/packages/update_apt.yaml)      | Updates and Upgrades all apt packages |
| [Install Docker](playbooks/packages/install_docker.yaml)   | Installs Docker                       |
| [Install Kubectl](playbooks/packages/install_kubectl.yaml) | Installs Kubectl                      |
| [Install Helm](playbooks/packages/install_helm.yaml)       | Installs Helm                         |
| [Install Kind](playbooks/packages/install_kind.yaml)       | Installs Kind                         |

### Inventory:

Example:

```ini
[servers]
<remote host alias> ansible_host=<remote host ipv4>
```

## Terraform presets:

| Preset                       | Provider | Description                                                    |
|------------------------------|----------|----------------------------------------------------------------|
| [Timeweb](terraform/timeweb) | Timeweb  | Preset that createas specified amount of master and worker VPS |

## Configs:

| Config                                | Description                             |
|---------------------------------------|-----------------------------------------|
| [nginx](configs/nginx.conf)           | Minimal nginx configuration             |
| [Prometheus](configs/prometheus.yaml) | Configuration for a Prometheus scraping |
| [Pre-commits](configs/pre-commit)     | Pre-commit hooks for Python and Golang  |

## Dockerfiles:

| Dockerfile                         | Description          |
|------------------------------------|----------------------|
| [Python](docker/Python.Dockerfile) | Python image builder |
| [Golang](docker/Golang.Dockerfile) | Golang image builder |

## CI / CD pipelines: (IN PROGRESS)

| Pipeline                                         | Platform | Description             |
|--------------------------------------------------|----------|-------------------------|
| [Python](pipelines/gitlab/python/.gitlab-ci.yml) | Gitlab   | Minimal Python pipeline |
| [Golang](pipelines/gitlab/golang/.gitlab-ci.yml) | Gitlab   | Minimal Golang pipeline |