# Homework #3

School ID: 202355517
Name: 권민규

## 1. Plug your USB memory stick into your Linux Box and then monitor what happens on you system with `tail -f ....` command

우분투에서 usb 연결 시 이하의 파일 두 곳에 로그가 남는다고 한다.

- `/var/log/syslog`
- `/var/log/kern.log`

```sh
sudo tail -f /var/log/syslog
```

해당 명령어를 작동시켜놓은 채 USB를 연결하면 다음과 같은 로그가 남는다.

![1-1](image-4.png)

```sh
sudo tail -f /var/log/kern.log
```

![1-2](image-5.png)

> wsl를 사용하고 있는 경우 USB를 연결하기 위해서 추가적인 작업을 해야할 필요가 있다. `usbipd-win`을 설치해 usb 드라이브와 wsl을 연결해야 하나, 이번 과제에서는 생략한다.

## 2. Do not unplug your USB memory, however, use the command `umount` to unmount your USB memory file system on your Linux box - explain this procedure step

`df -h` 명령어를 통해 마운트된 디바이스의 경로를 확인한다.

```sh
df -h
```

![2-1](image-6.png)

현재 `/mnt/e`에 마운트되어 있는 것을 확인할 수 있다. 이를 `umount` 명령어를 통해 언마운트한다.

```sh
sudo umount /mnt/e
```

언마운트 이후에는 `df -h` 명령어를 통해 마운트된 디바이스가 없는 것을 확인할 수 있다.

![2-2](image-7.png)

## 3. Change your home directory permission like this

- Only you can access your home directory (Use googling to find out the way of creation a new user account). The others cannot access your home directory
- To verify it, create a new user with a userID "Hacker" on you Linux box and try to access your home directory

유저를 생성하기 위해 `adduser` 명령어를 사용한다.
기본적으로 유저 이름은 소문자로만 가능한데, `--force-badname` 옵션을 사용하면 대문자도 가능하다.

```sh
sudo adduser --force-badname Hacker
```

패스워드는 `powerhacker`로 설정했다.
풀네임은 `Hacker`로 설정했다.

![3-1](image-8.png)

`sudo chmod 700 ~` 명령어를 통해 홈 디렉토리의 권한을 변경한다.

```sh
sudo chmod 700 ~
```

이후 Hacker 계정으로 접속해 접근을 시도한다.

```sh
su Hacker
cd ~
```

![3-2](image-9.png)

퍼미션이 거부되었다는 것을 확인할 수 있다.

## 4. Make a subdirectory named `foohaha`. Change permission mode into `drw-r--r--`. What happend if you try to access the `foohaha` directory?

`mkdir` 명령어를 통해 `foohaha` 디렉토리를 생성한다.

```sh
mkdir foohaha
```

`drw-r--r--`은 `744`로 표현할 수 있다. `chmod` 명령어를 통해 권한을 변경한다.

```sh
sudo chmod 744 foohaha
```

![4-1](image-10.png)

`eXecute` 권한이 없기 때문에 디렉토리에 접근할 수 없다.
다만 `Read` 권한이 있기 때문에 `ls` 명령어를 통해 디렉토리 내부를 확인할 수는 있다.

5. Change your shell prompt that displays as follows: `userID@hostName:date:time[the current working direcotry]$`

아래 명령어를 사용한다.

```sh
PS1="\u@\h:\d:\t[\w]$ "
```

프롬프트를 표시하는 변수인 `PS1`에 값을 할당한다.
`\u`는 유저 이름, `\h`는 호스트 이름, `\d`는 날짜, `\t`는 시간, `\w`는 현재 작업 디렉토리를 나타낸다.

![5-1](image-11.png)

영구적으로 변경하려면 해당 명령어를 `~/.bashrc` 파일에 추가하면 된다.
