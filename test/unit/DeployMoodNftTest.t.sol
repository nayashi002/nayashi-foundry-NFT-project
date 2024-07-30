// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Test,console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test{
    DeployMoodNft deployer;
    function setUp() public{
        deployer = new DeployMoodNft();
    }
    function testConvertsSvgToUri() public view{
       string memory expectedSvgUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdo"
                            "dD0iNTAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iYmxhY2siPkhpIHlvdXIgYnJvd3NlciBk"
                            "ZWNvZGVkIFRoaXM8L3RleHQ+PC9zdmc+";
       string memory svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"500\" height=\"500\"><text x=\"0\" y=\"15\" fill=\"black\">Hi your browser decoded This</text></svg>";

       string memory actualUri = deployer.svgToImageUri(svg);
       assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedSvgUri)));
    }
}