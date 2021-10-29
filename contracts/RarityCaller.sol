// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // Rarity.sol

interface rarity {
  function level_up(uint) external;
  function approve(address, uint256) external;
  function adventure(uint) external;
  function getApproved(uint256) external view returns (address);
}

interface rarity_crafting_materials_i {
  function adventure(uint) external;
}

interface rarity_gold {
  function claim(uint) external;
}

contract RarityCaller {

  rarity constant _rm = rarity(0xce761D788DF608BD21bdd59d6f4B54b2e27F25Bb);
  rarity_gold constant _gold = rarity_gold(0x2069B76Afe6b734Fb65D1d099E7ec64ee9CC76B2);
  rarity_crafting_materials_i constant _craft_i = rarity_crafting_materials_i(0x2A0F1cB17680161cF255348dDFDeE94ea8Ca196A);

  function adventure(uint256[] calldata _summoners) external {
    for (uint i = 0; i < _summoners.length; i++) {
      _rm.adventure(_summoners[i]);
    }
  }

  function level_up(uint256[] calldata _summoners) external {
    for (uint i = 0; i < _summoners.length; i++) {
      _rm.level_up(_summoners[i]);
    }
  }

  function dungeon(uint256[] calldata _summoners) external {
    for (uint i = 0; i < _summoners.length; i++) {
      _craft_i.adventure(_summoners[i]);
    }
  }

  function claim_gold(uint256[] calldata _summoners) external {
    for (uint i = 0; i < _summoners.length; i++) {
      _gold.claim(_summoners[i]);
    }
  }

  function is_approved(uint256[] calldata _summoners) external view returns (bool[] memory _is_approved) {
    _is_approved = new bool[](_summoners.length);
    for (uint i = 0; i < _summoners.length; i++) {
      _is_approved[i] = _rm.getApproved(_summoners[i]) == address(this);
    }
  }

  function approve_all(uint256[] calldata _summoners) external {
    for (uint i = 0; i < _summoners.length; i++) {
      _rm.approve(address(this), _summoners[i]);
    }
  }
}
