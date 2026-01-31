#### RUSTDESK-SERVER-BUILDER     

Сборка ```RUSTDESK-SERVER``` в Docker    

```bash
######################################## HELP ########################################

 server-cli --install                      | Установка исходного кода приложения
 server-cli --remove                       | Удаленией
 server-cli          --src                 |           исходного кода приложения
 server-cli          --builder             |           приложения для сборки rustdesk-server
 server-cli          --apps                |           сборки rustdesk-server
 server-cli          --img                 |           образа rustdesk-server
 server-cli --server                       | Сервер
 server-cli          --start               |        старт
 server-cli          --stop                |        стоп
 server-cli --build                        | Cборка приложения rustdesk-server
 server-cli         --server               | Cборка rustdesk-server в образе Docker
 server-cli         --sdk                  | Cборка sdk для rustdesk-server
 server-cli --deploy                       | Запись в Registry
 server-cli          --server              |                   образа rustdesk-server
 server-cli          --builder             |                   образа sdk rustdesk-server
 server-cli --help                         | Справка по работе приложения

######################################################################################

```

[RustDesk](https://rustdesk.com/)     

[RustDesk - клиент](github.com/rustdesk/rustdesk/releases)      

[RustDesk - сервер](https://github.com/rustdesk/rustdesk-server)

SDK хранит кэш в ```volume```

```bash
docker volume ls
DRIVER    VOLUME NAME
local     rustdesk-server-git-cache
local     rustdesk-server-registry-cache
```

Для удаления/очистки кэш => ```docker volume rm rustdesk-server-git-cache rustdesk-server-registry-cache```

В некоторых случах требуется удаления кэш для ```Docker``` => ```docker system prune -f```

Для авторизации на сервере требуется пара закрытого/открытого ключа ```ed25519```

После первой сборки в директории ```server``` в дополнении к файлам сервера будет собрана утилита ```rustdesk-utils```

```bash
work@work:~/rustdesk-server/server$ ls -l
итого 12588
-rwxr-xr-x 1 work work 3099280 янв 24 14:33 hbbr
-rwxr-xr-x 1 work work 9317840 янв 24 14:34 hbbs
-rwxr-xr-x 1 work work  461768 янв 24 14:33 rustdesk-utils

```

```bash
rustdesk-utils 
Usage:
    rustdesk-utils [command]

Available Commands:
    genkeypair                                   Generate a new keypair
    validatekeypair [public key] [secret key]    Validate an existing keypair
    doctor [rustdesk-server]                     Check for server connection problems
```

Которую следует использовать для генерации ключей

```bash
rustdesk-utils genkeypair
Public Key:  5/b1hZeKRTLIteQDs+HgrNepZBQ9/uYlvuIZGPwS5DE=
Secret Key:  LbcPDVIJz58o59sqw7X0pRwS0/qsUA+AuYbas/WTQwHn9vWFl4pFMsi15AOz4eCs16lkFD3+5iW+4hkY/BLkMQ==
```

Эти данные необходимо использовать в файле настройек ```.env```
