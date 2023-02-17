// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";



contract Escrow is Ownable {
    using Address for address payable;

    // create events 
    event Temp(address indexed user, uint256 amt);

    mapping(address => uint256) private _deposits;

    // all the params for this contract
    address public global_buyer;
    address public global_seller;
    uint256 public global_escrow_payment_1;
    uint256 public global_escrow_payment_2;
    uint256 public global_total_price;
    uint256 public global_inspection_start_date;
    uint256 public global_inspection_end_date;
    uint256 public global_inspection_extension_date;
    uint256 public global_moving_date;
    uint256 public global_closing_date;
    uint256 public global_free_funds_date;   
    IERC20 global_asset;

    // set all params
    constructor(
        IERC20 _asset, 
        address _buyer,
        address _seller,
        uint256 _escrow_payment_1,
        uint256 _escrow_payment_2,
        uint256 _total_price,
        uint256 _inspection_start_date,
        uint256 _inspection_end_date,
        uint256 _inspection_extension_date,
        uint256 _moving_date,
        uint256 _closing_date,
        uint256 _free_funds_date    
    ) Ownable(){
        // set all params

        if( ( _inspection_start_date <= _inspection_end_date) &&
            (_inspection_end_date <= _inspection_extension_date) &&
            (_inspection_extension_date  <= _moving_date) &&
            (_moving_date  <= _closing_date) &&
            (_closing_date  <= _free_funds_date) &&
            (_escrow_payment_1+_escrow_payment_2 == _total_price)
        )

        global_buyer = _buyer;
        global_seller = _seller;
        global_escrow_payment_1 = _escrow_payment_1;
        global_escrow_payment_2 = _escrow_payment_2;
        global_total_price = _total_price;
        global_inspection_start_date = _inspection_start_date;
        global_inspection_end_date = _inspection_end_date;
        global_inspection_extension_date = _inspection_extension_date;
        global_moving_date = _moving_date;
        global_closing_date = _closing_date;
        global_free_funds_date = _free_funds_date;   
        global_asset = _asset;
    }

    
    function seller_set_arbitration() public only_seller {
        emit Temp(address(0), 0);
    }

    
    
    
    // all modifiers
    
    modifier only_seller() {
        require(true, "some condition");
        _;
    }
}

