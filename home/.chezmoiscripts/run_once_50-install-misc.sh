#!/usr/bin/env bash

set -Eeuo pipefail

if [ "${DOTFILES_DEBUG:-}" ]; then
    set -x
fi

readonly BREW_PACKAGES=(
    age
    chezmoi
    jq
    nodebrew
    starship
    sheldon
    vim
    watchexec
    zsh
)

readonly CASK_PACKAGES=(
    1password
    docker
    google-chrome
    google-japanese-ime
    iterm2
    slack
    spectacle
    visual-studio-code
    zoom
)

function is_brew_package_installed() {
    local package="$1"

    brew list "${package}" &>/dev/null
}

function install_brew_packages() {
    local missing_packages=()

    for package in "${BREW_PACKAGES[@]}"; do
        if ! is_brew_package_installed "${package}"; then
            missing_packages+=("${package}")
        fi
    done

    if [[ ${#missing_packages[@]} -gt 0 ]]; then
        if "${CI:-false}"; then
            brew info "${missing_packages[@]}"
        else
            brew install --force "${missing_packages[@]}"
        fi
    fi
}

function install_brew_cask_packages() {
    local missing_packages=()

    for package in "${CASK_PACKAGES[@]}"; do
        if ! is_brew_package_installed "${package}"; then
            missing_packages+=("${package}")
        fi
    done

    if [[ ${#missing_packages[@]} -gt 0 ]]; then
        if "${CI:-false}"; then
            brew info --cask "${missing_packages[@]}"
        else
            brew install --cask --force "${missing_packages[@]}"
        fi
    fi
}

function main() {
    install_brew_packages
    install_brew_cask_packages
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
