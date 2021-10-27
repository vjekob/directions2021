controladdin "CICD Cover"
{
    Scripts = 'src\Controls\Cover\script\showcover.js';
    StartupScript = 'src\Controls\Cover\script\start.js';

    RequestedWidth = 120;
    RequestedHeight = 160;

    event OnReady();
    procedure ShowCover(ISBN: Text);
}
