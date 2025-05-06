namespace GyroUI {

    void RenderMenu() {
        if (UI::Begin("Gyroscope##settings", GyroCore::g_cfg.showSettingsWindow)) {
            if (UI::Checkbox("Full disk view", GyroCore::g_cfg.showFullDisk)) GyroCore::g_cfg.Save();
            if (UI::Checkbox("Rotating vectors", GyroCore::g_cfg.showVectors)) GyroCore::g_cfg.Save();
            if (UI::Checkbox("Bar graph", GyroCore::g_cfg.showBars)) GyroCore::g_cfg.Save();

            UI::Separator();
            UI::Text("Disk position");
            GyroCore::g_cfg.diskPos.x = UI::InputFloat("X", GyroCore::g_cfg.diskPos.x);
            GyroCore::g_cfg.diskPos.y = UI::InputFloat("Y", GyroCore::g_cfg.diskPos.y);
            GyroCore::g_cfg.diskRadius = UI::SliderFloat("Disk radius", GyroCore::g_cfg.diskRadius, 60, 300);

            if (UI::Button("Save"))   GyroCore::g_cfg.Save();
            UI::SameLine();
            if (UI::Button("Reload")) GyroCore::g_cfg.Load();
        }
        UI::End();
    }

}
