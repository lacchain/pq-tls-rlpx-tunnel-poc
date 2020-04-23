## Hyperledger Besu RLPx connections on top of TLS
This is a proof of concept for TLS encryption of the communication between two Hyperledger Besu nodes.

According to its specification, Ethereum nodes uses RLPx protocol for communication between nodes. This protocol carries encrypted messages using the ECIES method and all cryptographic operations are based on the secp256k1 elliptic curve.

Instead of replacing the RLPx protocol, we created a TLS tunnel between the peers, and then we redirected all the RLPx traffic through it.

This proof of concept is builded on top of [stunnel](https://www.stunnel.org/) which relies on the _de facto_ standard [OpenSSL](https://www.openssl.org/) for all the cryptographic operations.
