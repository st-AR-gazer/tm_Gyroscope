namespace GyroCore {

    class Config {
        /* flags */
        bool showFullDisk = true;
        bool showVectors  = false;
        bool showBars     = false;
        bool showSettingsWindow = true;

        /* layout */
        vec2  diskPos    = vec2(200, 300);
        float diskRadius = 150.0f;

        /* helpers */
        const string kPath = IO::FromDataFolder("GyroscopeConfig.json");

        void Load() {
            if (!IO::FileExists(kPath)) { Save(); return; }

            Json::Value j = Json::Parse(_IO::File::ReadFileToEnd(kPath));
            showFullDisk = bool(j.Get("showFullDisk", showFullDisk));
            showVectors  = bool(j.Get("showVectors",  showVectors));
            showBars     = bool(j.Get("showBars",     showBars));

            diskPos.x    = float(j.Get("diskPosX", diskPos.x));
            diskPos.y    = float(j.Get("diskPosY", diskPos.y));
            diskRadius   = float(j.Get("diskRadius", diskRadius));
        }

        void Save() const {
            Json::Value j;
            j["showFullDisk"] = showFullDisk;
            j["showVectors"]  = showVectors;
            j["showBars"]     = showBars;
            j["diskPosX"]     = diskPos.x;
            j["diskPosY"]     = diskPos.y;
            j["diskRadius"]   = diskRadius;

            _IO::File::WriteFile(kPath, tostring(j));
        }
    }

    Config g_cfg;

}
