require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.0",
  networks:{
    mumbai:{
      url : "https://rpc-mumbai.maticvigil.com" ,
      accounts : ["ba66dbb40cf7519cd9a94de2a388cfe3fdfb9770ef0dd4955e359f4d631bd143"]

    }
  }
};
