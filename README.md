<!-- This READM is based on the BEST-README-Template (https://github.com/othneildrew/Best-README-Template) -->
<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Apache 2.0 license][license-shield]][license-url]
[![Discord][discord-shield]][discord-url]
[![StackExchange][stackexchange-shield]][stackexchange-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
    <a href="https://github.com/iotaledger/iota-sandbox">
        <img src="banner.png" alt="Banner">
    </a>
    <h3 align="center">IOTA Sandbox</h3>
    <p align="center">
        A sandbox to easily start your own development environment
        <br />
        <a href="https://wiki.iota.org"><strong>Explore the docs »</strong></a>
        <br />
        <br />
        <a href="https://github.com/iotaledger/iota-sandbox/labels/bug">Report Bug</a>
        ·
        <a href="https://github.com/iotaledger/iota-sandbox/labels/request">Request Feature</a>
    </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#github-action">Github Action</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The IOTA Sandbox is a dedicated local network for developers to prototype and test smart contracts, INX plugins, and L1 applications within the IOTA ecosystem. It provides a safe, isolated environment for development and experimentation, crucial for ensuring functionality before deployment in production scenarios. 

> [!NOTE]
> Note that the IOTA Sandbox is not intended for creating production-ready networks, but rather for research and development purposes only. Also always consider using the [public testnet](https://wiki.iota.org/build/networks-endpoints/#public-testnet) first. Join us in pioneering the next wave of IOTA innovations, where you can experiment with confidence and community support.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Clone this repo and navigate into the `sandbox` directory.
If you use the sandbox for the first time or want to start fresh, bootstrap it first by running `./bootstrap.sh`. You might need to run it as root or with sudo. After that you can just simply start the sandbox with `docker compose up`. If you want to detach the console add the `-d` flag.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GITHUB ACTION -->
## Github Action

The IOTA Sandbox provides two actions to use the sandbox in CI/CD for testing. `setup` and `tear-down`.

### Usage

You can add those actions to your workflow by simply using it in a step. You can specify a version of the sandbox to use, or a commit-ish ref, to use any commit, branch or tag.

```yml
name: Sandbox

on:
  workflow-dispatch

env:
  # Specify which profiles you want to enable.
  COMPOSE_PROFILES: 'inx-indexer, chronicle'

jobs:
  sandbox:
    runs-on: ubuntu-latest
    steps:
      - name: Start iota sandbox
        uses: 'iotaledger/iota-sandbox/.github/actions/setup@VERION'
        with:
          # Specify a iota-sandbox version.
          version: 'v1.1.0'
          # In case you want to use a commit-ish ref, set version to '' and specify a commit-ish ref
          branch: branch-xy

      - name: Tear down iota sandbox
        uses: 'iotaledger/iota-sandbox/.github/actions/setup@VERSION'
```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open a feature request.
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/iotaledger/iota-sandbox.svg?style=for-the-badge
[contributors-url]: https://github.com/iotaledger/iota-sandbox/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/iotaledger/iota-sandbox.svg?style=for-the-badge
[forks-url]: https://github.com/iotaledger/iota-sandbox/network/members
[stars-shield]: https://img.shields.io/github/stars/iotaledger/iota-sandbox.svg?style=for-the-badge
[stars-url]: https://github.com/iotaledger/iota-sandbox/stargazers
[issues-shield]: https://img.shields.io/github/issues/iotaledger/iota-sandbox.svg?style=for-the-badge
[issues-url]: https://github.com/iotaledger/iota-sandbox/issues
[license-shield]: https://img.shields.io/github/license/iotaledger/iota-sandbox.svg?style=for-the-badge
[license-url]: https://github.com/iotaledger/iota-sandbox/blob/main/LICENSE
[discord-shield]: https://img.shields.io/badge/Discord-9cf.svg?style=for-the-badge&logo=discord
[discord-url]: https://discord.iota.org
[stackexchange-shield]: https://img.shields.io/badge/StackExchange-9cf.svg?style=for-the-badge&logo=stackexchange
[stackexchange-url]: https://iota.stackexchange.com
