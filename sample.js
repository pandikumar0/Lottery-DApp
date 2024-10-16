Creating Project:

> mkdir Lottery
> cd Lottery

Basic Commands:
> truffle init
> truffle compile
> truffle migrate


Queries:
> truffle console

> let lottery = await Lottery.at("0x4bB66ab91b601b02b19dcA27b2452F121d0bF487");

> let accounts = await web3.eth.getAccounts();
> await lottery.enter({ from: accounts[0], value: web3.utils.toWei("0.02", "ether") });
> await lottery.enter({ from: accounts[1], value: web3.utils.toWei("0.02", "ether") });
>  await lottery.enter({ from: accounts[2], value: web3.utils.toWei("0.02", "ether") });
> await lottery.enter({ from: accounts[3], value: web3.utils.toWei("0.02", "ether") });

> let manager = await lottery.manager();

//get players

> let players = await lottery.getPlayers();
> console.log(players);

> let winner = await lottery.pickWinner({ from: manager });
> console.log(winner);



