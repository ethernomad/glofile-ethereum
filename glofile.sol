/**
 * @title Glofile
 * @author Jonathan Brown <jbrown@bluedroplet.com>
 */
contract Glofile {

  enum GlofileType { Anon, Person, Project, Organization, Proxy, Parody, Bot }
  enum SafetyLevel { Safe, NSFW, NSFL }

  struct Glofile {
    bool dontIndex;
    GlofileType glofileType;
    SafetyLevel safetyLevel;
    uint16 publicKeyCount;
    string fullName;
    string location;
    bytes topics;
    bytes uris;
    bytes parents;
    bytes children;
    bytes3[] foregroundColors;
    bytes3[] backgroundColors;
    bytes3[] bioLangs;
    bytes[] avatars;
    bytes[] coverImages;
    bytes[] backgroundImages;
    mapping (bytes3 => bytes) bioTranslations;
  }

  mapping (address => Glofile) glofiles;

  event Updated(address indexed account);
  event Deleted(address indexed account);
  event PublicKeyAdded(address indexed account, uint indexed i, bytes publicKey);
  event PublicKeyDeleted(address indexed account, uint indexed i);

  /**
   * @notice Set your Glofile don't index flag to `dontIndex`
   * @dev Sets the "don't index" flag. Glofiles with this flag set should only be accessible directly and not be discoverable via search.
   * @param dontIndex flag to indicate that this Glofile should not be indexed
   */
  function setDontIndex(bool dontIndex) {
    glofiles[msg.sender].dontIndex = dontIndex;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile type to `glofileType`
   * @dev Sets the Glofile type.
   * @param glofileType Glofile type
   */
  function setGlofileType(GlofileType glofileType) {
    glofiles[msg.sender].glofileType = glofileType;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile safety level to `safetyLevel`
   * @dev Sets the safety level. The account may publish content that is less safe than this, so long as it is flagged as such.
   * @param safetyLevel safety level
   */
  function setSafetyLevel(SafetyLevel safetyLevel) {
    glofiles[msg.sender].safetyLevel = safetyLevel;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile full name to `fullName`
   * @dev Sets the full name.
   * @param fullName UTF-8 string of full name - max length 128 chars
   */
  function setFullName(string fullName) {
    glofiles[msg.sender].fullName = fullName;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile location
   * @dev Sets the location. A dedicated contract could be used for more sophisticated location functionality.
   * @param location UTF-8 string of location - max string length 128 chars
   */
  function setLocation(string location) {
    glofiles[msg.sender].location = location;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile topics
   * @dev Sets the topics. This is a hint that this account will be publishing content in other contracts under these topics.
   * @param topics UTF-8 string of space-separated topic compressed with DEFLATE
   */
  function setTopics(bytes topics) {
    glofiles[msg.sender].topics = topics;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile URIs
   * @dev Sets the URIs. These URIs can reference anthing associated with the account, e.g. social network accounts.
   * @param uris UTF-8 string of space-separated percent-encoded URIs compressed with DEFLATE
   */
  function setUris(bytes uris) {
    glofiles[msg.sender].uris = uris;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile parents
   * @dev Sets the parents.
   * @param parents UTF-8 string of space-separated usernames compressed with DEFLATE
   */
  function setParents(bytes parents) {
    glofiles[msg.sender].parents = parents;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile children
   * @dev Sets the children.
   * @param children UTF-8 string of space-separated usernames compressed with DEFLATE
   */
  function setChildren(bytes children) {
    glofiles[msg.sender].children = children;
    Updated(msg.sender);
  }

  /**
   * @notice Get Glofile basic info
   * @dev Gets all the info that can be retreived in a single call.
   * @param account Glofile to access
   * @return dontIndex flag to indicate that this Glofile should not be indexed
   * @return glofileType Glofile type
   * @return safetyLevel safety level
   * @return fullName UTF-8 string of full name
   * @return location UTF-8 string of location
   * @return topics UTF-8 of space-separated topics compressed with DEFLATE
   * @return uris UTF-8 string of space-separated percent-encoded URIs compressed with DEFLATE
   * @return parents UTF-8 string of space-separated usernames compressed with DEFLATE
   * @return children UTF-8 string of space-separated usernames compressed with DEFLATE
   */
  function getBasicInfo(address account) constant returns (bool dontIndex, GlofileType glofileType, SafetyLevel safetyLevel, string fullName, string location, bytes topics, bytes uris, bytes parents, bytes children) {
    Glofile glofile = glofiles[account];
    dontIndex = glofile.dontIndex;
    glofileType = glofile.glofileType;
    safetyLevel = glofile.safetyLevel;
    fullName = glofile.fullName;
    location = glofile.location;
    topics = glofile.topics;
    uris = glofile.uris;
    parents = glofile.parents;
    children = glofile.children;
  }

  /**
   * @notice Set your Glofile foreground colors
   * @dev Sets all the foreground colors.
   * @param colors array of RGB triplets
   */
  function setForegroundColors(bytes3[] colors) {
    glofiles[msg.sender].foregroundColors = colors;
    Updated(msg.sender);
  }

  /**
   * @notice Set your Glofile background colors
   * @dev Sets all the background colors.
   * @param colors array of RGB triplets
   */
  function setBackgroundColors(bytes3[] colors) {
    glofiles[msg.sender].backgroundColors = colors;
    Updated(msg.sender);
  }

  /**
   * @notice Get Glofile colors
   * @dev Gets the foreground and background colors
   * @param account Glofile to access
   * @return foregroundColors array of RGB triplets of foreground colors
   * @return backgroundColors array of RGB triplets of background colors
   */
  function getColors(address account) constant returns (bytes3[] foregroundColors, bytes3[] backgroundColors) {
    Glofile glofile = glofiles[account];
    foregroundColors = glofile.foregroundColors;
    backgroundColors = glofile.backgroundColors;
  }

  /**
   * @notice Set your Glofile bio with langauge code `lang`
   * @dev Sets the bio in a specific language.
   * @param lang 3 letter ISO 639-3 language code
   * @param translation UTF-8 Markdown of bio compressed with DEFLATE - max Markdown length 256 chars
   */
  function setBio(bytes3 lang, bytes translation) {
    Glofile glofile = glofiles[msg.sender];
    // Check if we already have the language code.
    for (uint i = 0; i < glofile.bioLangs.length; i++) {
      if (glofile.bioLangs[i] == lang) {
        break;
      }
    }
    if (i == glofile.bioLangs.length) {
      // We didn't find it. Try to find a free slot.
      for (i = 0; i < glofile.bioLangs.length; i++) {
        if (glofile.bioLangs[i] == 0) {
          break;
        }
      }
      if (i == glofile.bioLangs.length) {
        // We didn't find a free slot. Make the array bigger.
        glofile.bioLangs.length++;
      }
      glofile.bioLangs[i] = lang;
    }
    // Set translation.
    glofile.bioTranslations[lang] = translation;
    Updated(msg.sender);
  }

  /**
   * @notice Delete your Glofile bio with language code `lang`
   * @dev Deletes a bio translation.
   * @param lang 3 letter ISO 639-3 language code
   */
  function deleteBio(bytes3 lang) {
    Glofile glofile = glofiles[msg.sender];
    for (uint i = 0; i < glofile.bioLangs.length; i++) {
      if (glofile.bioLangs[i] == lang) {
        delete glofile.bioLangs[i];
        break;
      }
    }
    // Delete the actual mapping in case a client accesses without checking
    // language key.
    delete glofile.bioTranslations[lang];
    Updated(msg.sender);
  }

  /**
   * @notice Delete all of your Glofile bio translations
   * @dev Deletes all of the bio translations.
   */
  function deleteAllBioTranslations() {
    Glofile glofile = glofiles[msg.sender];
    // Delete the actual mappings in case a client accesses without checking
    // language key.
    for (uint i = 0; i < glofile.bioLangs.length; i++) {
      delete glofile.bioTranslations[glofile.bioLangs[i]];
    }
    delete glofile.bioLangs;
    Updated(msg.sender);
  }

  /**
   * @notice Get the list of language code a Glofile bio is available in
   * @dev Gets the list of language codes the bio is available in.
   * @param account Glofile to access
   * @return array of 3 letter ISO 639-3 language codes
   */
  function getBioLangCodes(address account) constant returns (bytes3[]) {
    return glofiles[account].bioLangs;
  }

  /**
   * @notice Get the Glofile bio with language code `lang`
   * @dev Gets the bio in a specific language.
   * @param lang 3 letter ISO 639-3 language code
   * @param account Glofile to access
   * @return UTF-8 Markdown of bio compressed with DEFLATE
   */
  function getBioTranslation(bytes3 lang, address account) constant returns (bytes) {
    return glofiles[account].bioTranslations[lang];
  }

  /**
   * @notice Set your Glofile avatar with index `i` to `ipfsHash`
   * @dev Sets the avatar with a specific index to an IPFS hash.
   * @param i index of avatar to set
   * @param ipfsHash binary IPFS hash of image
   */
  function setAvatar(uint i, bytes ipfsHash) {
    bytes[] avatars = glofiles[msg.sender].avatars;
    // Make sure the array is long enough.
    if (avatars.length <= i) {
      avatars.length = i;
    }
    avatars[i] = ipfsHash;
    Updated(msg.sender);
  }

  /**
   * @notice Delete your Glofile avatar with index `i`
   * @dev Deletes an avatar with a specific index.
   * @param i index of avatar to delete
   */
  function deleteAvatar(uint i) {
    delete glofiles[msg.sender].avatars[i];
    Updated(msg.sender);
  }

  /**
   * @notice Delete all your Glofile avatars
   * @dev Deletes all avatars from the Glofile.
   */
  function deleteAllAvatars() {
    delete glofiles[msg.sender].avatars;
    Updated(msg.sender);
  }

  /**
   * @notice Get the number of Glofile avatars
   * @dev Gets the number of avatars.
   * @param account Glofile to access
   * @return number of avatars
   */
  function getAvatarCount(address account) constant returns (uint) {
    return glofiles[account].avatars.length;
  }

  /**
   * @notice Get the Glofile avatar with index `i`
   * @dev Gets the avatar with a specific index.
   * @param i index of avatar to get
   * @param account Glofile to access
   * @return binary IPFS hash of image
   */
  function getAvatar(uint i, address account) constant returns (bytes) {
    return glofiles[account].avatars[i];
  }

  /**
   * @notice Set your Glofile cover image with index `i` to `ipfsHash`
   * @dev Sets the cover image with a specific index to an IPFS hash.
   * @param i index of cover image to set
   * @param ipfsHash binary IPFS hash of image
   */
  function setCoverImage(uint i, bytes ipfsHash) {
    bytes[] coverImages = glofiles[msg.sender].coverImages;
    // Make sure the array is long enough.
    if (coverImages.length <= i) {
      coverImages.length = i;
    }
    coverImages[i] = ipfsHash;
    Updated(msg.sender);
  }

  /**
   * @notice Delete your Glofile cover image with index `i`
   * @dev Deletes the cover image with a specific index.
   * @param i index of cover image to delete
   */
  function deleteCoverImage(uint i) {
    delete glofiles[msg.sender].coverImages[i];
    Updated(msg.sender);
  }

  /**
   * @notice Delete all your Glofile cover images
   * @dev Deletes all cover images from the Glofile.
   */
  function deleteAllCoverImages() {
    delete glofiles[msg.sender].coverImages;
    Updated(msg.sender);
  }

  /**
   * @notice Get the number of Glofile cover images
   * @dev Gets the number of cover images.
   * @param account Glofile to access
   * @return number of cover images
   */
  function getCoverImageCount(address account) constant returns (uint) {
    return glofiles[account].coverImages.length;
  }

  /**
   * @notice Get the Glofile cover image with index `i`
   * @dev Gets the cover image with a specific index.
   * @param i index of cover image to get
   * @param account Glofile to access
   * @return binary IPFS hash of image
   */
  function getCoverImage(uint i, address account) constant returns (bytes) {
    return glofiles[account].coverImages[i];
  }

  /**
   * @notice Set your Glofile background image with index `i` to `ipfsHash`
   * @dev Sets the background image with a specific index to an IPFS hash.
   * @param i index of background image to set
   * @param ipfsHash binary IPFS hash of image
   */
  function setBackgroundImage(uint i, bytes ipfsHash) {
    bytes[] backgroundImages = glofiles[msg.sender].backgroundImages;
    // Make sure the array is long enough.
    if (backgroundImages.length <= i) {
      backgroundImages.length = i;
    }
    backgroundImages[i] = ipfsHash;
    Updated(msg.sender);
  }

  /**
   * @notice Delete your Glofile background image with index `i`
   * @dev Deletes the background image with a specific index.
   * @param i index of background image to delete
   */
  function deleteBackgroundImage(uint i) {
    delete glofiles[msg.sender].backgroundImages[i];
    Updated(msg.sender);
  }

  /**
   * @notice Delete all your Glofile background images
   * @dev Deletes all the background images.
   */
  function deleteAllBackgroundImages() {
    delete glofiles[msg.sender].backgroundImages;
    Updated(msg.sender);
  }

  /**
   * @notice Get the number of Glofile background images
   * @dev Gets the number of background images.
   * @param account Glofile to access
   * @return number of background images
   */
  function getBackgroundImageCount(address account) constant returns (uint) {
    return glofiles[account].backgroundImages.length;
  }

  /**
   * @notice Get the Glofile background image with index `i`
   * @dev Gets the background image with a specific index.
   * @param i index of cover image to get
   * @param account Glofile to access
   * @return binary IPFS hash of image
   */
  function getBackgroundImage(uint i, address account) constant returns (bytes) {
    return glofiles[account].backgroundImages[i];
  }

  /**
   * @notice Add a public key to your Glofile
   * @dev Adds a public key.
   * @param publicKey UTF-8 public key compressed with DEFLATE
   */
  function addPublicKey(bytes publicKey) {
    uint i = glofiles[msg.sender].publicKeyCount++;
    PublicKeyAdded(msg.sender, i, publicKey);
  }

  /**
   * @notice Delete the public key with index `i` from your Glofile
   * @dev Deletes the public key with a specific index.
   * @param i index of public key to delete
   */
  function deletePublicKey(uint i) {
    PublicKeyDeleted(msg.sender, i);
  }

  /**
   * @notice Copy entire Glofile from `source`
   * @dev Copies the Glofile from another account to this one.
   * @param source account of Glofile to copy from
   * TODO: check this works
   */
  function copyEntireGlofile(address source) {
    glofiles[msg.sender] = glofiles[source];
    Updated(msg.sender);
  }

  /**
   * @notice Delete your entire Glofile
   * @dev Deletes the Glofile completely.
   */
  function deleteEntireGlofile() {
    delete glofiles[msg.sender];
    Deleted(msg.sender);
  }

}
