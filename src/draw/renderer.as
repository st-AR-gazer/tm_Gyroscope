namespace GyroDraw {

    void DrawFullDisk(const GyroCore::State &in st, const GyroCore::Config &in cfg);
    void DrawVectors (const GyroCore::State &in st, const GyroCore::Config &in cfg);
    void DrawBars    (const GyroCore::State &in st, const GyroCore::Config &in cfg);

    void Render() {
        if (!GyroCore::g_state.hasCar) return;

        nvg::Save();
        if (GyroCore::g_cfg.showFullDisk) DrawFullDisk(GyroCore::g_state, GyroCore::g_cfg);
        if (GyroCore::g_cfg.showVectors)  DrawVectors (GyroCore::g_state, GyroCore::g_cfg);
        if (GyroCore::g_cfg.showBars)     DrawBars    (GyroCore::g_state, GyroCore::g_cfg);
        nvg::Restore();
    }

}
