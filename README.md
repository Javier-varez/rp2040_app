# rp2040 App

Application to play around with a raspberry pi pico in bare metal (no sdk)

## Getting the sources

This project uses other git dependencies. There is a master manifest file for [repo](https://gerrit.googlesource.com/git-repo/) that defines all dependencies and can be used to download all dependencies [here](https://github.com/Javier-varez/manifest). You can sync the sources by getting repo first:

```sh
# Or install from source.
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo
```

Then you can setup the repository by running:

```sh
mkdir repo
cd repo
repo init -u https://github.com/Javier-varez/manifest -g rp2040_app
repo sync -c
```

Once this finishes you should have the following tree:

```
./
├── buildsystem/
├── cortex-m_atomics/
├── cortex-m_startup/
├── Makefile -> buildsystem/template.mk
├── postform/
├── rp2040_app/
└── third_party/
```

## Building the project

The build process is described for Ubuntu 20.04. Other linux distributions or operating systems might need different configurations. You might want to use the [ATE Builder](https://hub.docker.com/repository/docker/javiervarez/ate_builder) docker image instead of setting up the local environment. This image already contains all tools required to build the software, so no other packages need to be installed

If you decided to install all the packages locally, you will need to check the dependencies listed in the [ATE Build System](https://github.com/Javier-varez/buildsystem) project. In addition, you need to make sure to install the following dependencies:

```sh
sudo apt install \
    git \
    make \
    python3 \
    python-is-python3 \
    clang \
    lld
```

You will also need the `gcc-arm-none-eabi` toolchain, which you can find [here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads). Make sure to add the bin folder to the `PATH` environment variable.

After getting these requirements, run make in the root of the repository we previously downloaded with repo. The output should be similar to this:

```sh
root@afe22045af7c:/opt/repo# make -j
[libcortex_m_startup] CXX startup.cpp
[libcortex_m_startup] LINKER_SCRIPT cortex-m_startup/cortex-m.ld
[libcortex_m_startup] AR
[rp2040_app] CXX main.cpp
[rp2040_app] AS bs2_default_padded_checksummed.s
[rp2040_app] LD
[rp2040_app.hex] objcopy
[rp2040_app.uf2] uf2conv
```

You can find the uf2 target image under `build/targets/rp2040_app.uf2`. Drag and drop this file into the MSC device mounted by the rp2040.
