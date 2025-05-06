namespace GyroDraw {

    void DrawBars(const GyroCore::State &in st, const GyroCore::Config &in cfg) {
        vec2 origin = cfg.diskPos + vec2(-cfg.diskRadius*2.0f, 0);
        const array<vec3> dirs  = {st.dir, st.left, st.up};
        const array<string> lbl = {"Dir Y","Left Y","Up Y"};

        for (uint i = 0; i < dirs.Length; ++i) {
            float h = dirs[i].y * cfg.diskRadius;
            vec2 p0 = origin + vec2(i * (cfg.diskRadius*.7f), 0);
            vec2 p1 = p0 + vec2(0, -h);

            /* bar */
            nvg::BeginPath();
            nvg::MoveTo(p0+vec2(-8,0));
            nvg::LineTo(p0+vec2( 8,0));
            nvg::StrokeWidth(1);
            nvg::StrokeColor(vec4(1,1,1,.4));
            nvg::Stroke();

            /* line */
            nvg::BeginPath();
            nvg::MoveTo(p0);
            nvg::LineTo(p1);
            nvg::StrokeWidth(6);
            nvg::StrokeColor(vec4(0,1,0,.9));
            nvg::Stroke();

            /* head */
            nvg::FontSize(14);
            nvg::TextAlign(nvg::Align::Center|nvg::Align::Top);
            nvg::FillColor(vec4(1,1,1,.8));
            nvg::Text(p0+vec2(0,4), lbl[i]);
        }
    }

}
