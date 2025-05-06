namespace GyroDraw {

    void DrawFullDisk(const GyroCore::State &in st, const GyroCore::Config &in cfg) {
        vec2  c = cfg.diskPos;
        float R = cfg.diskRadius;

        /* ring */
        nvg::BeginPath();
        nvg::Circle(c, R);
        nvg::StrokeWidth(2);
        nvg::StrokeColor(vec4(1,1,1,0.8));
        nvg::Stroke();

        /* orientation */
        float yaw   = Math::Atan2(st.dir.x, st.dir.z);
        float depth = Math::Lerp(1.0f, 0.6f, Math::Abs(Math::Dot(st.dir, st.up)));

        nvg::Save();
        nvg::Translate(c);
        nvg::Rotate(-yaw);
        nvg::Scale(vec2(1, depth));

        /* shaft */
        nvg::BeginPath();
        nvg::MoveTo(vec2(0, 0));
        nvg::LineTo(vec2(0, -R * 0.8f));
        nvg::StrokeWidth(4);
        nvg::StrokeColor(vec4(0.2,0.8,1,1));
        nvg::Stroke();

        /* arrow head */
        nvg::BeginPath();
        nvg::MoveTo(vec2(0, -R * 0.8f));
        nvg::LineTo(vec2(-8, -R * 0.65f));
        nvg::LineTo(vec2( 8, -R * 0.65f));
        nvg::ClosePath();
        nvg::FillColor(vec4(0.2,0.8,1,1));
        nvg::Fill();

        nvg::Restore();
    }

}
