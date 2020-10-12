## TLS connections encapsulating Hyperledger Besu RPLx communication 
This is a proof of concept for TLS encryption of the communication between two Hyperledger Besu nodes.

According to its specification, Ethereum nodes uses RLPx protocol for communication between nodes. This protocol carries encrypted messages using the ECIES method and all cryptographic operations are based on the secp256k1 elliptic curve.

Instead of replacing the RLPx protocol, we created a TLS tunnel between the peers, and then we redirected all the RLPx traffic through it.

This proof of concept is builded on top of [stunnel](https://www.stunnel.org/) which relies on the _de facto_ standard [OpenSSL](https://www.openssl.org/) for all the cryptographic operations.

## Copyright 2020 LACChain

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
