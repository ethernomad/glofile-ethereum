var web3 = require('web3');
var bs58 = require('bs58');


var glofileContract = web3.eth.contract([{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getParentCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteBackgroundImage","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"dontIndex","type":"bool"}],"name":"setDontIndex","outputs":[],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllCoverImages","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteCoverImage","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"ipfsHash","type":"bytes"}],"name":"setAvatar","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getCoverImage","outputs":[{"name":"","type":"bytes"}],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllTopics","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteChild","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteUri","outputs":[],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllParents","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getBackgroundImage","outputs":[{"name":"","type":"bytes"}],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteParent","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteTopic","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getAvatarCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getTopic","outputs":[{"name":"","type":"string"}],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getAvatar","outputs":[{"name":"","type":"bytes"}],"type":"function"},{"constant":false,"inputs":[{"name":"fullName","type":"string"}],"name":"setFullName","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"topic","type":"string"}],"name":"setTopic","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"colors","type":"bytes3[]"}],"name":"setForegroundColors","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"parent","type":"string"}],"name":"setParent","outputs":[],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllBackgroundImages","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"uri","type":"string"}],"name":"setUri","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"location","type":"string"}],"name":"setLocation","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"safetyLevel","type":"uint8"}],"name":"setSafetyLevel","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getBackgroundImageCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"ipfsHash","type":"bytes"}],"name":"setCoverImage","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"ipfsHash","type":"bytes"}],"name":"setBackgroundImage","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getChildCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getParent","outputs":[{"name":"","type":"string"}],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getUriCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllUris","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getCoverImageCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllAvatars","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"}],"name":"deleteAvatar","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getBasicInfo","outputs":[{"name":"dontIndex","type":"bool"},{"name":"glofileType","type":"uint8"},{"name":"safetyLevel","type":"uint8"},{"name":"fullName","type":"string"},{"name":"location","type":"string"},{"name":"foregroundColors","type":"bytes3[]"},{"name":"backgroundColors","type":"bytes3[]"},{"name":"languages","type":"bytes3[]"}],"type":"function"},{"constant":false,"inputs":[{"name":"language","type":"bytes3"}],"name":"deleteBio","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"glofileType","type":"uint8"}],"name":"setGlofileType","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"i","type":"uint256"},{"name":"child","type":"string"}],"name":"setChild","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getChild","outputs":[{"name":"","type":"string"}],"type":"function"},{"constant":false,"inputs":[{"name":"language","type":"bytes3"},{"name":"translation","type":"bytes"}],"name":"setBio","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"i","type":"uint256"}],"name":"getUri","outputs":[{"name":"","type":"string"}],"type":"function"},{"constant":false,"inputs":[{"name":"languages","type":"bytes3[]"}],"name":"setLanguages","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getTopicCount","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllChildren","outputs":[],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"},{"name":"language","type":"bytes3"}],"name":"getBio","outputs":[{"name":"","type":"bytes"}],"type":"function"},{"constant":true,"inputs":[{"name":"account","type":"address"}],"name":"getBioLanguages","outputs":[{"name":"","type":"bytes3[]"}],"type":"function"},{"constant":false,"inputs":[],"name":"deleteAllBioTranslations","outputs":[],"type":"function"},{"constant":false,"inputs":[{"name":"colors","type":"bytes3[]"}],"name":"setBackgroundColors","outputs":[],"type":"function"},{"anonymous":false,"inputs":[{"indexed":true,"name":"account","type":"address"}],"name":"Update","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"account","type":"address"}],"name":"Delete","type":"event"}]);

var glofileRaw = glofileContract.at("0x5dc2e401e29ea16e51ebcecaef129c15fed5a5e8");


/*

compress / decompress bio
get all bios

*/

var glofile = {};

glofile.getBasicInfo = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }
  
  return glofileRaw.getBasicInfo(account, {}, 'pending');
}

glofile.getBioLanguages = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }
  
  return glofileRaw.getBioLanguages(account, {}, 'pending');
}

glofile.getBio = function(lang, account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }
  
  return glofileRaw.getBio(account, lang, {}, 'pending');
}

glofile.setAllAvatars = function(avatars) {

  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllAvatars();
  for (i = 0; i < avatars.length; i++) {
    var out = bs58.decode(avatars[i]);
    var encoded = "0x" + new Buffer(out).toString('hex');
    tx[tx.length] = glofileRaw.setAvatar(i, encoded, {gas: 200000});
    console.log(encoded);
  }
  return tx;
}

glofile.getAllAvatars = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getAvatarCount(account, {}, 'pending').toFixed();
  console.log(count);
  var avatars = [];
  for (var i = 0; i < count; i++) {
    avatars[i] = bs58.encode(new Buffer(glofileRaw.getAvatar(account, i, {}, 'pending').substr(2), 'hex'));
  }
  return avatars;
}

glofile.setBioCompressed = function(lang, translation) {
}

glofile.getBioCompressed = function(lang, account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }
}

glofile.setAllCoverImages = function(coverImages) {
  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllCoverImages();
  for (i = 0; i < coverImages.length; i++) {
    tx[tx.length] = glofileRaw.setCoverImage(i, coverImages[i]);
  }
  return tx;
}

glofile.getAllCoverImages = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getCoverImageCount(account, {}, 'pending');
  var coverImages = [];
  for (var i = 0; i < count; i++) {
    coverImages[i] = glofileRaw.getCoverImage(account, i, {}, 'pending');
  }
  return coverImages;
}

glofile.setAllBackgroundImages = function(backgroundImages) {
  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllBackgroundImages();
  for (i = 0; i < backgroundImages.length; i++) {
    tx[tx.length] = glofileRaw.setAvatar(i, backgroundImages[i]);
  }
  return tx;
}

glofile.getAllBackgroundImages = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getBackgroundImageCount(account, {}, 'pending');
  var backgroundImages = [];
  for (var i = 0; i < count; i++) {
    backgroundImages[i] = glofileRaw.getBackgroundImage(account, i, {}, 'pending');
  }
  return backgroundImages;
}

glofile.setAllTopics = function(topics) {
  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllTopics();
  for (i = 0; i < topics.length; i++) {
    tx[tx.length] = glofileRaw.setTopic(i, topics[i]);
  }
  return tx;
}

glofile.getAllTopics = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getTopicCount(account, {}, 'pending');
  var topics = [];
  for (var i = 0; i < count; i++) {
    topics[i] = glofileRaw.getTopic(account, i, {}, 'pending');
  }
  return topics;
}

glofile.setAllParents = function(parents) {
  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllParents();
  for (i = 0; i < parents.length; i++) {
    tx[tx.length] = glofileRaw.setParent(i, parents[i]);
  }
  return tx;
}

glofile.getAllParents = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getParentCount(account, {}, 'pending');
  var parents = [];
  for (var i = 0; i < count; i++) {
    topics[i] = glofileRaw.getParent(account, i, {}, 'pending');
  }
  return parents;
}

glofile.setAllChildren = function(children) {
  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllChildren();
  for (i = 0; i < children.length; i++) {
    tx[tx.length] = glofileRaw.setChild(i, parents[i]);
  }
  return tx;
}

glofile.getAllChildren = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getChildCount(account, {}, 'pending');
  var children = [];
  for (var i = 0; i < count; i++) {
    children[i] = glofileRaw.getChild(account, i, {}, 'pending');
  }
  return children;
}

glofile.setAllUris = function(uris) {
  var tx = [];
  tx[tx.length] = glofileRaw.deleteAllUris();
  for (i = 0; i < uris.length; i++) {
    tx[tx.length] = glofileRaw.setUri(i, uris[i]);
  }
  return tx;
}

glofile.getAllUris = function(account) {
  if (account == null) {
    account = web3.eth.defaultAccount;
  }

  var count = glofileRaw.getUriCount(account, {}, 'pending');
  var uris = [];
  for (var i = 0; i < count; i++) {
    children[i] = glofileRaw.getUri(account, i, {}, 'pending');
  }
  return children;
}


web3.setProvider(new web3.providers.HttpProvider('http://localhost:8545'));

web3.eth.defaultAccount = web3.eth.accounts[0];

console.log(glofile.getBasicInfo());

//console.log(glofile.setAllAvatars(["QmbjAQL9L63hsJD5MsCCL8AwUNwW4gPQvfTwi6iimu8igH"]));
console.log(glofile.getAllAvatars());

console.log(glofileRaw.setBio('abc', 'hello', {gas: 3000000}));
console.log(glofileRaw.getBioLanguages(web3.eth.defaultAccount, {}, 'pending'));

process.exit();
