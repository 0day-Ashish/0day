<h1>🎯 PROJECT TITLE:DECENTRALIZED VOTING SMART CONTRACT </h1> <br>
A fully on-chain decentralized voting system that enables users to create proposals, vote once using their wallet addresses, and execute proposals after a deadline. Designed for DAOs, community decisions, or collaborative governance. Transparent, tamper-proof, and simple to use.

<h1> 📝 DESCRIPTION </h1>
This smart contract lets users create proposals with a title and duration. Other users can vote once per proposal within the allowed timeframe. The voting results are visible on-chain, and after the deadline, the proposal can be executed. The system ensures a fair one-vote-per-user mechanism using wallet addresses.

✨ FEATURES
🧾 Create proposals with descriptions and expiration times

🗳️ One vote per wallet per proposal

⏰ Enforces deadline-based voting

❌ Prevents double voting

📊 Public proposal data access

✅ Proposal execution after deadline

⚙️ SMART CONTRACT FUNCTIONS
🆕 createProposal(string description, uint durationInMinutes)
Creates a new proposal with a user-defined duration (in minutes).

🗳️ vote(uint proposalId)
Casts a vote on a specific proposal. Only one vote per wallet is allowed.

🔍 getProposal(uint proposalId)
Retrieves full proposal details: description, total votes, deadline, and execution status.

✅ hasVoted(uint proposalId, address voterAddress)
Returns true if the given address has already voted on that proposal.

🚀 executeProposal(uint proposalId)
Executes the proposal once the voting period has ended. Prevents re-execution.

🧪 HOW TO DEPLOY & TEST IN REMIX
Open Remix IDE at https://remix.ethereum.org

Create a new file called DecentralizedVoting.sol

Paste the smart contract code into the file

Compile it using Solidity version ^0.8.0

Go to the "Deploy & Run" tab and choose an environment (JavaScript VM or MetaMask)

Click Deploy

Use the following sample interactions:

createProposal("Ban Pineapple Pizza", 3)

vote(1) from multiple wallet addresses

getProposal(1) to view live vote count

executeProposal(1) after the deadline to finalize the proposal

📌 USE CASES
🏛️ DAO and decentralized governance

🧠 Group or community decision-making

🎓 Blockchain education and demonstrations

🔐 Secure and transparent public polls

🖼️ SCREENSHOT SECTION
<img width="1470" alt="Screenshot 2025-05-26 at 2 37 35 PM" src="https://github.com/user-attachments/assets/67baf02a-8e4b-42f0-a696-6189ac299e04" />
<img width="1470" alt="Screenshot 2025-05-26 at 2 38 16 PM" src="https://github.com/user-attachments/assets/7014e25d-6c8b-49a3-8bf8-993fba9e381b" />

📄 LICENSE
MIT License © 2025 YourName

