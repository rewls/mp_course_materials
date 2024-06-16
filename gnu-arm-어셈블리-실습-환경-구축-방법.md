# GNU ARM 어셈블리 실습 환경 구축 방법

## 실습 환경 구성 요소

- Toolchain (C/C++ compiler, assembler, linke, and binary utilities)

    - GNU ARM Embedded Toolchain

- Version control system

    - Git

- Build utilities

    - Make (Usemake in MSYS2)

    - CMake

    - Some custom python scritps

- ARM processor emulator(Virtual machine)

    - QEMU

- Example source tree

    - mp_course_materials project in ubiworks (https://github.com/ubinos-edu)

## 실습 환경 구축 및 사용법

> Ubinos Getting Started Guide 참조
>
>   - https://ubinos.org -> Getting Started Guide
>
>   - 타겟 보드로 QEMU 가상 머신만 사용하기 때문에 J-Link, STM32CubeProgrammer, OpenOCD, Putty는 설치할 필요 없음

- [Dockerfile](Dockerfile)

    - [리눅스에 개발환경 설정하기](#리눅스에-개발환경-설정하기), [유비노스 기본 소스 트리 가져오기](#유비노스-기본-소스-트리-가져오기)

    ```sh
    $ docker build -t microprocessor .
     Allow X server connection
    $ xhost +local:*
    $ docker run -e DISPLAY=$DISPLAY \
                 -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
                 --name microprocessor microprocessor
    $ source ~/microprocessor/.venv/bin/activate
    $ cd ~/microprocessor/ubiworks
    ```

### 리눅스에 개발 환경 설정하기

> Arch linux

#### 1. 필요 패키지를 설치한다.

```sh
# pacman -Syu
# pacman -S base-devel ccache cmake git noto-fonts python python-pip \
    python-virtualenv qemu qemu-system-arm tk vim xterm
```

```sh
$ python -m venv .venv
$ source .venv/bin/activate
(.venv) $ pip install ttkwidgets
```

```sh
$ git clone https://aur.archlinux.org/ncurses5-compat-libs.git
$ cd ncurses5-compat-libs
$ gpg --recv-keys 19882D92DDA4C400C22C0D56CC2AF4472167BE03
$ makepkg -srci
```

#### 2. 그누 암 임베디드 툴체인 설치 패키지를 받는다.

```sh
$ curl -O https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
```

#### 3. 그누 암 임베디드 툴체인을 설치한다.

```sh
# mkdir /opt/toolchain
# cd /opt/toolchain
# tar xfj /home/rewls/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
# ln -s gcc-arm-none-eabi-10.3-2021.10/ gcc-arm-none-eabi
```

#### 4. 환경변수 `PATH`에 그누 암 임데디드 툴체인 실행 파일 경로를 추가한다.

```sh
$ echo "export PATH=\"/opt/toolchain/gcc-arm-none-eabi/bin:$PATH\"" >> ~/.bashrc
```

### 유비노스 기본 소스 트리 가져오기

```sh
$ git clone https://github.com/ubinos/ubiworks.git
$ cd ubiworks
$ git submodule update --init
$ git submodule foreach git switch ubinos-main
```

### 라이브러리 설치하기

1. 라이브러리 관리자를 연다.

    ```sh
    $ cd make
    $ make xmgr
    ```

2. mp_course_materials 라이브러리를 설치한다.

## Build commands

```sh
$ make help
```

## 일반적인 빌드 및 실행 방법

1. 라이브러리를 최신 버전으로 강제 갱신한다.

    ```sh
    $ cd make
    $ make xmgr
    ```

    - Check for update all

    - Check updatable libraries

    - Update

2. 사용할 응용을 선택한다.

    ```sh
    $ make xsel
    ```

3. 예전 빌드 결과물을 완전 삭제(cleand)한 후, 구성(config) 및 빌드(build)한다.

    ```sh
    $ make rebuildd
    ```

4. 실행 이진파일을 빌드한 후 빌드된 실행 이진 파일을 타겟 보드에 적재한다.

    ```sh
    $ make load
    ```

5. 디버깅을 시작한다.

    ```sh
    $ make debug
    ```

6. `appmain` 함수에 중단점을 설정한다.

    ```sh
    (gdb) b appmain
    ```

7. 중단점을 설정한 appmain 함수까지 수행한다.

    ```sh
    (gdb) c
    ```

## How to write and submit report

1. GitHub 저장소 복제

    ```sh
    $ git clone git@github.com/ubinos-edu/ubiworks_mpc2024a_<student id>_<name initial>.git
    $ cd ubiworks_mpc2024a_<student id>_<name initial>
    $ git submodule update --init
    $ git submodule foreach git switch ubinos-main
    $ cd ..
    ```

2. 라이브러리를 최신 버전으로 강제 갱신

    ```sh
    $ cd make
    $ make xmgr
    ```

    1. Hide ubinos default library list

    2. Fetch and check for update all

    3. Check updatable libraries

    4. Update

3. 퀴즈 복사

    ```sh
    $ make xsel
    ```

    - Select quiz

    - Copy 

    - Name <quiz name>_<student id>_<name initial>

4. `app` 디렉토리에서 코드 수정

5. 실행

    ```sh
    $ make rebuildd
    $ make load && make debug
    (gdb) b appmain
    (gdb) c
    ```

6. GitHub으로 제출

    ```sh
    $ git add -A
    $ git commit -m "<commit message>"
    $ git push
    ```
