(function adblock() {
  const { Platform } = Spicetify;
  if (!(Platform)) {
    setTimeout(adblock, 300)
    return
  }

  var styleSheet = document.createElement("style")

  styleSheet.innerHTML =
    `
    .main-topBar-UpgradeButton, .MnW5SczTcbdFHxLZ_Z8j, .WiPggcPDzbwGxoxwLWFf, .ReyA3uE3K7oEz7PTTnAn, .main-leaderboardComponent-container, .sponsor-container, a.link-subtle.main-navBar-navBarLink.GKnnhbExo0U9l7Jz2rdc{
    display: none !important;
    }
    `
  document.body.appendChild(styleSheet)
  delayAds()
  var billboard = Spicetify.Platform.AdManagers.billboard.displayBillboard;
  Spicetify.Platform.AdManagers.billboard.displayBillboard = function (arguments) {
    Spicetify.Platform.AdManagers.billboard.finish()
    // hook before call
    var ret = billboard.apply(this, arguments);
    // hook after call
    console.log("Adblock.js: Billboard blocked! Leave a star!")
    Spicetify.Platform.AdManagers.billboard.finish()
    const observer = new MutationObserver((mutations, obs) => {
      const billboardAd = document.getElementById('view-billboard-ad');
      if (billboardAd) {
        Spicetify.Platform.AdManagers.billboard.finish()
        obs.disconnect();
        return;
      }
    });

    observer.observe(document, {
      childList: true,
      subtree: true
    });
    return ret;
  };
  function delayAds() {
    console.log("Ads delayed: Adblock.js")
    Spicetify.Platform.AdManagers.audio.audioApi.cosmosConnector.increaseStreamTime(-100000000000)
    Spicetify.Platform.AdManagers.billboard.billboardApi.cosmosConnector.increaseStreamTime(-100000000000)
  }
  setInterval(delayAds, 720 * 10000);


})() 
