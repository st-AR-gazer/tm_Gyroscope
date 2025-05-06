void Main() {
    GyroCore::g_cfg.Load();
}

void Render() {
    GyroCore::g_state.Update();
    GyroDraw::Render();
    GyroUI::RenderMenu();
}