pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract EdgewareERC20 is ERC20Mintable {
    address public controller;

    constructor() public {
        controller = msg.sender;
    }

    /**
    * @dev Burns a specific amount of tokens.
    * @param account The address to burn tokens from.
    * @param value The amount of token to be burned.
    */
    function burn(address account, uint256 value) public onlyAsController {
        _burn(account, value);
    }

    modifier onlyAsController() {
        require (msg.sender == controller, "Can only be called by controller");
        _;
    }
}
