#!/bin/bash

# Configure Ubuntu

screen -S STARKNET &&
cd ~ &&
sudo apt update &&
sudo apt full-upgrade &&

# Install dev tools

python3 -V &&
sudo apt install -y python3-pip &&
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev &&
sudo apt-get install libgmp-dev &&
pip3 install fastecdsa &&
sudo apt-get install -y pkg-config &&

# Install Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
sudo apt install cargo &&
git clone --branch v0.4.0 https://github.com/eqlabs/pathfinder.git &&
sudo apt install python3.8-venv &&

# Node

cd pathfinder/py &&
python3 -m venv .venv &&
source .venv/bin/activate &&
PIP_REQUIRE_VIRTUALENV=true pip install --upgrade pip &&
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt &&
pytest &&
cargo build --release --bin pathfinder;