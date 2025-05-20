# Blockchain-Based Distributed Energy Trading System

This project implements a decentralized energy trading platform using Clarity smart contracts on the Stacks blockchain. The system enables peer-to-peer energy trading between producers and consumers in a secure, transparent, and efficient manner.

## Overview

The system consists of five main smart contracts:

1. **Producer Verification Contract**: Validates and registers energy generators
2. **Consumer Verification Contract**: Validates and registers energy users
3. **Production Tracking Contract**: Records energy generation amounts
4. **Consumption Tracking Contract**: Records energy usage
5. **Trading Contract**: Manages peer-to-peer energy exchange

## Features

- Registration and verification of energy producers and consumers
- Tracking of energy production and consumption
- Creation of energy offers with customizable pricing and expiration
- Peer-to-peer energy trading between verified participants
- Complete trade history and record keeping

## Contract Details

### Producer Verification Contract

This contract handles the registration and verification of energy producers:

- Producers can register with details like name, capacity, and location
- Admin can verify producers to ensure they meet required standards
- Read-only functions to check producer status and details

### Consumer Verification Contract

Similar to the producer contract, this handles consumer registration:

- Consumers can register with details like name, maximum consumption, and location
- Admin can verify consumers to ensure they meet required standards
- Read-only functions to check consumer status and details

### Production Tracking Contract

This contract records energy generation:

- Verified producers can record their energy production
- Each production record includes the amount and timestamp
- Admin can verify production records
- Tracks total production per producer

### Consumption Tracking Contract

This contract records energy usage:

- Verified consumers can record their energy consumption
- Each consumption record includes the amount and timestamp
- Admin can verify consumption records
- Tracks total consumption per consumer

### Trading Contract

This contract enables peer-to-peer energy trading:

- Producers can create energy offers with specific amounts and prices
- Offers have an expiration block height
- Consumers can purchase energy from active offers
- Partial purchases are supported
- Complete trade history is maintained

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - Clarity development environment
- Basic knowledge of Clarity and Stacks blockchain

### Installation

1. Clone this repository
2. Navigate to the project directory
3. Use Clarinet to deploy and test the contracts

```bash
# Initialize a new Clarinet project (if not already done)
clarinet new my-energy-trading

# Copy the contract files to the contracts directory
cp contracts/* my-energy-trading/contracts/

# Run tests
cd my-energy-trading
clarinet test

