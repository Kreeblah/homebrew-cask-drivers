cask "xerox-print-driver" do
  on_el_capitan :or_older do
    version "4.17.1_1980"
    sha256 "36b1ddf1f598ceaf6f91d38b0d228be3f8f6188c251761424cbea7a869488883"

    url "https://download.support.xerox.com/pub/drivers/CQ8570/drivers/macosx1011/pt_BR/XeroxPrintDriver_#{version}.dmg"

    livecheck do
      skip "Legacy version"
    end

    pkg "Xerox Print Driver #{version.sub(/_.*/, "")}.pkg"
  end
  on_sierra do
    version "5.2.0_2115"
    sha256 "9989b6c127fca8c97b24bd86fd4d20035cd094c69e3fd41f6a243361f86483ec"

    url "https://download.support.xerox.com/pub/drivers/CQ8570/drivers/macos1012/pt_BR/XeroxPrintDriver_#{version}.dmg"

    livecheck do
      skip "Legacy version"
    end

    pkg "Xerox Print Driver #{version.sub(/_.*/, "")}.pkg"
  end
  on_high_sierra do
    version "5.6.0_2187"
    sha256 "562143dcd8fda5df84d9cdc39e09f242898e40d63866c596632d7cd7f7c85844"

    url "https://download.support.xerox.com/pub/drivers/BALTORO_HF/drivers/macOS10_13/pt_BR/XeroxDrivers_#{version}.dmg"

    livecheck do
      skip "Legacy version"
    end

    pkg "Xerox Drivers #{version.sub(/_.*/, "")}.pkg"
  end
  on_mojave do
    version "5.8.0_2275"
    sha256 "8934306cb5d2322e0cd6e058a4634edbd9c9392aa83364ed5859fb3941516b27"

    url "https://download.support.xerox.com/pub/drivers/ALB80XX/drivers/macOS10_13/pt_BR/XeroxDrivers_#{version}.dmg"

    livecheck do
      skip "Legacy version"
    end

    pkg "Xerox Drivers #{version.sub(/_.*/, "")}.pkg"
  end
  on_catalina do
    version "5.10.1_2333"
    sha256 "c8d4ca41d939aee275831eeebcd0d84aa2f219e24d4100c63ef0b78110fe7680"

    url "https://download.support.xerox.com/pub/drivers/ALB80XX/drivers/macOS10_15/pt_BR/XeroxDrivers_#{version}.dmg"

    livecheck do
      skip "Legacy version"
    end

    pkg "Xerox Drivers #{version.sub(/_.*/, "")}.pkg"
  end
  on_big_sur :or_newer do
    version "5.12.1_2403"
    sha256 "696ee196543de04c636e80e62c652851dbffe7b2d0d8b35484d92a26ba00d02d"

    url "https://download.support.xerox.com/pub/drivers/ALB80XX/drivers/macOSx11/pt_BR/XeroxDrivers_#{version}.dmg"

    livecheck do
      url :homepage
      regex(/XeroxDrivers[._-](\d+(?:\.\d+)*_\d+)\.dmg/i)
    end

    pkg "Xerox Drivers #{version.sub(/_.*/, "")}.pkg"
  end

  name "Xerox Print Driver"
  desc "Drivers for Xerox printers"
  homepage "https://www.support.xerox.com/en-us/product/phaser-6510/downloads"

  uninstall launchctl: [
              "com.aviatainc.powerengage.helper.XRTK",
              "com.aviatainc.powerengage.XRTK",
              "com.xerox.AnalyticsAgent",
            ],
            quit:      "com.aviatainc.powerengage.EngageLauncher",
            pkgutil:   [
              "com.xerox.drivers.pkg",
              "com.xerox.installer.addprintqueue",
              "com.xerox.installer.finishup",
              "com.xerox.print.xeroxPrinter.pkg",
            ],
            delete:    "/Library/Caches/Xerox",
            rmdir:     "/Library/Application Support/Xerox"

  zap pkgutil: "com.xerox.drivers.pkg",
      trash:   "~/Library/Application Support/PowerENGAGE/XEROX"
end
