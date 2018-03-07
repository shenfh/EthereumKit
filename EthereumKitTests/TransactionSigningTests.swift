//
//  TransactionSigningTests.swift
//  EthereumKitTests
//
//  Created by yuzushioh on 2018/03/07.
//  Copyright © 2018 yuzushioh. All rights reserved.
//

import XCTest
import SMP
@testable import EthereumKit

class TransactionSigningTests: XCTestCase {
    
    func testTransactionSigning() {
        let signTransaction = SignTransaction(
            value: BInt("1000000000000000000")!,
            to: Address(string: "0x91c79f31De5208fadCbF83f0a7B0A9b6d8aBA90F"),
            nonce: 5,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("21000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 3)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86c0585170cdc1e008252089491c79f31de5208fadcbf83f0a7b0a9b6d8aba90f880de0b6b3a76400008029a076da637d6a2fa3197c0a1b7c9bc2a4326c9a1dbe94c4eb8449bf59919f89b762a00887bcdd883f2cc2c892e55665419fad6522d4e7e1f7c226282078de98f4069c"
        )
    }
    
    func testTransactionSigning2() {
        let signTransaction = SignTransaction(
            value: BInt("100000000000000000")!,
            to: Address(string: "0x3B958949EfCc8362Dd05179cCE8eB5e16BefeBdA"),
            nonce: 5,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("21000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 3)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86c0585170cdc1e00825208943b958949efcc8362dd05179cce8eb5e16befebda88016345785d8a00008029a022ab35848cce6ddf0ef76ea6ab25cebe449d822073492c6e2b90a2707bd061d0a0414e6f152f66a62158a59a9ffe095bd1beacf0d2510b9204aec8a8cacbcbdf31"
        )
    }
    
    func testTransactionSigning3() {
        let signTransaction = SignTransaction(
            value: BInt("500000000000000000")!,
            to: Address(string: "0xfc9d3987f7fcd9181393084a94814385b28cEf81"),
            nonce: 5,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("200000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 3)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86d0585170cdc1e0083030d4094fc9d3987f7fcd9181393084a94814385b28cef818806f05b59d3b200008029a096479bbc675f9ae3bdc23f6fa22adf5bc009c1661b6336bdeaa2959dce6d55dba0302981091abc6dc4736676b93c24fde68d11bad45741a2d8c5bfdfb633039863"
        )
    }
    
    func testTransactionSigning4() {
        let signTransaction = SignTransaction(
            value: BInt("1000000000000000000")!,
            to: Address(string: "0x91c79f31De5208fadCbF83f0a7B0A9b6d8aBA90F"),
            nonce: 0,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("21000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 1)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86c8085170cdc1e008252089491c79f31de5208fadcbf83f0a7b0a9b6d8aba90f880de0b6b3a76400008025a0f62b35ed65db13b02ccab29eeea2d29990a690a8620f8bee56b765c5357c82b8a05c266f2d429c87f8c903f7089870aa169638518c5c3a56ade8ce66ffcb5c3991"
        )
    }
    
    func testTransactionSigning5() {
        let signTransaction = SignTransaction(
            value: BInt("1000000000000000000")!,
            to: Address(string: "0x3B958949EfCc8362Dd05179cCE8eB5e16BefeBdA"),
            nonce: 0,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("21000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 1)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86c8085170cdc1e00825208943b958949efcc8362dd05179cce8eb5e16befebda880de0b6b3a76400008025a0134a7e77c95c5839bd931788f1b7a3ff15567d9a79ef0b00cfe4baedf33c60d8a00123a678f76e288a0180ef3248c90608365bf95d20d1a16b9b3d23edbe420408"
        )
    }
    
    func testTransactionSigning6() {
        let signTransaction = SignTransaction(
            value: BInt("5000000000000000000")!,
            to: Address(string: "0xfc9d3987f7fcd9181393084a94814385b28cEf81"),
            nonce: 0,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("200000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 1)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "db173e58671248b48d2494b63a99008be473268581ca1eb78ed0b92e03b13bbc")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86d8085170cdc1e0083030d4094fc9d3987f7fcd9181393084a94814385b28cef81884563918244f400008025a07f47866c109ce1fbc0b4c9d4c5825bcd9be13903a082256d70c8cf6c05a59bfca045f6b0407996511b30f72fbb567e0b0dbaa367b9b920f73ade435f8e0e2776b6"
        )
    }
    
    func testTransactionSigning7() {
        let signTransaction = SignTransaction(
            value: BInt("1000000000000000")!,
            to: Address(string: "0x88b44BC83add758A3642130619D61682282850Df"),
            nonce: 0,
            gasPrice: BInt("99000000000")!,
            gasLimit: BInt("21000")!,
            data: Data()
        )
        
        let signer = EIP155Signer(chainID: 3)
        let signiture = Crypto.sign(
            signer.hash(signTransaction: signTransaction),
            privateKey: Data(hex: "0ac03c260512582a94295185cfa899e0cb8067a89a61b7b5435ec524c088203c")
        )
        
        let (r, s, v) = signer.calculateRSV(signiture: signiture)
        
        let data = RLP.encode([
            signTransaction.nonce,
            signTransaction.gasPrice,
            signTransaction.gasLimit,
            signTransaction.to.data,
            signTransaction.value,
            signTransaction.data,
            v, r, s
        ])
        
        XCTAssertEqual(
            data!.toHexString().appending0xPrefix, "0xf86b8085170cdc1e008252089488b44bc83add758a3642130619d61682282850df87038d7ea4c680008029a01edbb41d5936c75314cd75d795e2c79ef8882eb6daa041f22a894f84dec7a97fa020569fc39ffa956592f40020b2afb710ba8dabebee4de32fb7dce22a1209b90d"
        )
    }
    
    func testTransactionSigningWithWallet() {
        let mnemonic = Mnemonic.create(entropy: Data(hex: "000102030405060708090a0b0c0d0e0f"))
        let seed = Mnemonic.createSeed(mnemonic: mnemonic)
        let wallet = Wallet(seed: seed, network: .test)
        
        XCTAssertEqual(wallet.generateAddress(at: 1), "0x94bD4ddE47B2F10C4DbE9377D5c3a83eDf22860D")
        XCTAssertEqual(wallet.generatePrivateKey().raw.toHexString(), "0ac03c260512582a94295185cfa899e0cb8067a89a61b7b5435ec524c088203c")
        
        let rawTransaction = RawTransaction(
            value: BInt("100000000000000000")!,
            address: "0x94bD4ddE47B2F10C4DbE9377D5c3a83eDf22860D",
            nonce: 0
        )
        
        let tx = wallet.signTransaction(rawTransaction)
        XCTAssertEqual(
            tx,
        "0xf86c8085170cdc1e008252089494bd4dde47b2f10c4dbe9377d5c3a83edf22860d88016345785d8a00008029a08a7073c62a3d2708d11a04ab835d740e4a804bae7b7daefa08febf4878025d0fa006be9422f299cafefe1a7ea7dd043131c5141693140248144c4c6d09dd42fd9d"
        )
    }
    
    func testTransactionSigningWithWallet2() {
        let mnemonic = Mnemonic.create(entropy: Data(hex: "000102030405060708090a0b0c0d0e0f"))
        let seed = Mnemonic.createSeed(mnemonic: mnemonic)
        let wallet = Wallet(seed: seed, network: .test)
        
        XCTAssertEqual(wallet.generateAddress(at: 2), "0xebf3cf4E89C9Be367EC86d76D5Dc977c21877C14")
        XCTAssertEqual(wallet.generatePrivateKey().raw.toHexString(), "0ac03c260512582a94295185cfa899e0cb8067a89a61b7b5435ec524c088203c")
        
        let rawTransaction = RawTransaction(
            value: BInt("1000000000000000000")!,
            address: "0xebf3cf4E89C9Be367EC86d76D5Dc977c21877C14",
            nonce: 0
        )
        
        let tx = wallet.signTransaction(rawTransaction)
        XCTAssertEqual(
            tx,
        "0xf86c8085170cdc1e0082520894ebf3cf4e89c9be367ec86d76d5dc977c21877c14880de0b6b3a76400008029a03562007f46c34b968874680f2324b2cf6910bcfc066740d2ebb020e6652dba58a068379abc69786ccee531112cdff1a39a1f68d2a5eca2a42aca07cf68f743209c"
        )
    }
    
    func testTransactionSigningWithWallet3() {
        let mnemonic = Mnemonic.create(entropy: Data(hex: "000102030405060708090a0b0c0d0e0f"))
        let seed = Mnemonic.createSeed(mnemonic: mnemonic)
        let wallet = Wallet(seed: seed, network: .test)
        
        XCTAssertEqual(wallet.generateAddress(at: 3), "0x2F9eE3EdE488e3b7702Be866e2DC80A2a962f8a6")
        XCTAssertEqual(wallet.generatePrivateKey().raw.toHexString(), "0ac03c260512582a94295185cfa899e0cb8067a89a61b7b5435ec524c088203c")
        
        let rawTransaction = RawTransaction(
            value: BInt("1000000000000000000")!,
            address: "0x2F9eE3EdE488e3b7702Be866e2DC80A2a962f8a6",
            nonce: 0
        )
        
        let tx = wallet.signTransaction(rawTransaction)
        XCTAssertEqual(
            tx,
        "0xf86c8085170cdc1e00825208942f9ee3ede488e3b7702be866e2dc80a2a962f8a6880de0b6b3a76400008029a00e3136fed6f4fb70eba248a531903f21a2ea849b4814b9fb89758f39fd987338a005eaabaaf0db182941d925ab06c91f5aa39f21611f110511b60dc6ffa0e31feb"
        )
    }
}
