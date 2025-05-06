namespace GyroDraw {

void DrawVectors(const GyroCore::State &in st, const GyroCore::Config &in cfg) {
    float t    = Time::Now / 1000.0f;
    vec2 base  = cfg.diskPos + vec2(cfg.diskRadius * 2.2f, 0);

    const array<vec3> dirs = { st.dir, st.left, st.up };
    const array<string> lbl = { "Dir", "Left", "Up" };

    for (uint i = 0; i < dirs.Length; ++i) {
        vec2  c   = base + vec2(0, i * (cfg.diskRadius + 16));
        float ang = Math::Atan2(dirs[i].x, dirs[i].z);
        float rot = t * 0.8f + ang;
        float r   = cfg.diskRadius * 0.4f;

        nvg::Save();
        nvg::Translate(c);
        nvg::Rotate(-rot);

        /* shaft */
        nvg::BeginPath();
        nvg::Circle(vec2(), r);
        nvg::StrokeWidth(2);
        nvg::StrokeColor(vec4(1,1,1,0.6));
        nvg::Stroke();

        /* head */
        nvg::BeginPath();
        nvg::MoveTo(vec2(0,0));
        nvg::LineTo(vec2(0,-r));
        nvg::StrokeWidth(3);
        nvg::StrokeColor(vec4(1,0.5,0,1));
        nvg::Stroke();

        nvg::Restore();

        nvg::FontSize(14);
        nvg::TextAlign(nvg::Align::Center | nvg::Align::Top);
        nvg::FillColor(vec4(1,1,1,0.8));
        nvg::Text(c + vec2(0, r + 5), lbl[i]);
    }
}

}
