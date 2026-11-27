# DevOps Learn

Мой рабочий репозиторий по DevOps. Здесь лежит всё, что я прошёл руками в своей лаборатории: скрипты, конфиги, манифесты, плейбуки. Идея простая: чтобы любую тему можно было быстро вспомнить или показать на живом примере.

Лаборатория: Windows-хост с Hyper-V, внутри виртуальные машины на Ubuntu Server 24.04 LTS и Windows Server 2022.

---

## Стек

| Направление | Что использую |
|---|---|
| ОС | Ubuntu Server 24.04 LTS, Windows Server 2022 (Active Directory, DHCP) |
| Контейнеры | Docker, Docker Compose |
| Оркестрация | Kubernetes (Minikube), Helm |
| Автоматизация / IaC | Bash, Ansible, Terraform |
| CI/CD | GitHub Actions |
| Мониторинг | Prometheus, Grafana |
| Базы данных | PostgreSQL (в процессе) |
| Сеть и безопасность | UFW, базовая настройка сети и firewall |

---

## Структура репозитория

```text
devops-learn/
├── scripts/                  # Bash-скрипты: мониторинг диска, бэкапы, статус сервера
├── myapp/                    # Dockerfile + простое приложение
├── compose-app/              # Docker Compose (nginx + postgres + grafana)
├── monitoring/               # Prometheus + Grafana
├── ansible/                  # Playbooks (nginx, docker)
├── k8s-advanced/             # Продвинутый Kubernetes
│   ├── configmap-files/      # ConfigMap из файлов
│   ├── volumes/              # emptyDir, hostPath, PersistentVolumeClaim
│   ├── ingress/              # Ingress (nginx-ingress)
│   ├── helm/                 # Helm: values, upgrade, rollback
│   ├── statefulset/          # StatefulSet + Headless Service
│   └── jobs/                 # Jobs и CronJobs
├── terraform/                # Terraform: variables, locals, modules, for_each
└── README.md
```

---

## Что пройдено

### Linux и Bash
- Работа в терминале: файлы и папки, права (`chmod`, `chown`), поиск (`grep`, `find`), редактор `nano`.
- Bash-скрипты: проверка свободного места на диске, резервное копирование, вывод статуса сервера.
- Автозапуск по расписанию через `cron`.
- Свой сервис под `systemd` (`systemctl`, `journalctl`).
- Сеть и firewall: `ip`, `ss`, открытие портов через `ufw`.

### Docker и Docker Compose
- Запуск, остановка и удаление контейнеров, логи, вход внутрь (`docker exec`).
- Свой `Dockerfile` для простого приложения (папка `myapp/`).
- Многоконтейнерная связка в `docker-compose` (nginx + postgres + grafana).

### Git и GitHub Actions
- Весь цикл: `init`, `add`, `commit`, `push`, работа с репозиторием на GitHub.
- CI/CD-пайплайн на GitHub Actions, который срабатывает при каждом push.

### Ansible
- Inventory-файл и плейбуки на YAML.
- Установка nginx и Docker на серверы одной командой.
- Принцип идемпотентности: плейбук можно запускать много раз, результат один и тот же.

### Мониторинг
- Prometheus собирает метрики, Grafana рисует дашборды.
- Всё поднимается через Docker Compose.

### Kubernetes (Minikube)
- Основы: Pod, Deployment, Service, Namespace, YAML-манифесты.
- **ConfigMap** из значений и из файлов, подключение в Pod.
- **Secrets**: создание из файла, монтирование в Pod.
- **Volumes**: `emptyDir`, `hostPath`, `PersistentVolumeClaim`. Проверял, что данные переживают перезапуск Pod.
- **Helm**: свой чарт, установка `bitnami/nginx`, `helm upgrade` через `values.yaml`, `helm rollback`.
- **StatefulSet + Headless Service** для приложений с данными.
- **Jobs и CronJobs** для разовых и периодических задач.
- **Ingress (nginx-ingress)**: манифесты написаны, разбираюсь с доступом снаружи на Minikube с драйвером docker.

### Terraform
- Провайдер `local`: создание файлов как ресурсов, чтобы понять принцип работы.
- `variables`, `locals`, `outputs`.
- Модули и `for_each`.
- Цикл `init → plan → apply → destroy`.

### Windows Server 2022
- Лаборатория в Hyper-V: контроллер домена, Active Directory.
- DHCP: настройка области, параметры области (шлюз, DNS), проверка выдачи адресов клиенту.

---

## С какими проблемами сталкивался

Самое полезное я вынес из ошибок, поэтому записываю их сюда.

- **Minikube: `RSRC_INSUFFICIENT_CORES`.** Виртуальной машине выделено мало процессоров. Помогло увеличить число vCPU в Hyper-V и запускать с явными `--cpus` и `--memory`.
- **Pod не создаётся: `volumeMounts[0].name: Not found`.** Имя в `volumeMounts` должно в точности совпадать с именем в `volumes`. Классическая опечатка.
- **`helm upgrade` падает с `cannot patch`.** Конфликт между уже созданным ресурсом и новыми значениями. Разбирался через `helm get values` и сверку `values.yaml`.
- **Ingress на Minikube не открывался по IP.** С драйвером docker адрес `192.168.49.2` не всегда доступен снаружи. Нужно изучать `minikube tunnel` и проброс портов.
- **DHCP не выдавал адреса.** Не хватало опции 003 (маршрутизатор) в параметрах области. После добавления клиент получил шлюз и DNS.

---

## В планах

- [ ] PostgreSQL: пользователи, базы, бэкапы через `pg_dump`, запуск в Kubernetes
- [ ] Довести Ingress до рабочего состояния
- [ ] Python для автоматизации: скрипты, работа с API
- [ ] Сети глубже: DNS, HTTP, `tcpdump`
- [ ] Облако: Azure или Яндекс Облако, деплой через Terraform

---

## Как пользоваться

```bash
git clone https://github.com/Carnag3/devops-learn.git
cd devops-learn
```

Каждая папка самодостаточна. Внутри лежат файлы и команды для запуска. Для Kubernetes нужен запущенный Minikube (`minikube start`), для Terraform установленный `terraform`.

---

## Автор

**Carnage** — github.com/Carnag3
