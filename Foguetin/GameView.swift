import UIKit

class GameView : UIView {
    
    let stopButton = UIButton()
    let termometroTubo = UIImageView(image: UIImage(named: "termometroTubo"))
    let termometroBase = UIImageView(image: UIImage(named: "termometroBase"))
    let planetaDerretendo = UIImageView(image: UIImage(named: "planetaDerretendo"))
    let timeLabel = UILabel()
    let targetView = UIView()
    let cursorView = UIView()
    let background = UIImageView(image: UIImage(named: "background"))
    let buttonBG = UIView()
    
    let winView = WinView()
    let loseView = LoseView()
    
    weak var delegate: GameViewDelegate?

    var targetPositionY: NSLayoutConstraint?
    var cursorPositionY: NSLayoutConstraint?
    var auxMovement: CGFloat = 1
    var movement: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewsHierarchy()
        setViewsAttributes()
        setContraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewsHierarchy() {
        addSubview(background)
        addSubview(buttonBG)
        addSubview(stopButton)
        addSubview(planetaDerretendo)
        addSubview(termometroBase)
        addSubview(termometroTubo)
        termometroTubo.addSubview(targetView)
        addSubview(cursorView)
    }
    
    private func setViewsAttributes() {
        
        stopButton.backgroundColor = .blue
        stopButton.setTitle("Parar", for: .normal)
        stopButton.layer.cornerRadius = 35
        
        buttonBG.backgroundColor = .black
        buttonBG.layer.cornerRadius = 40
        
        //termometroTubo.layer.cornerRadius = 10
        targetView.backgroundColor = .systemYellow
        cursorView.backgroundColor = .black
        
    }
    
    func setContraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        termometroTubo.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        targetView.translatesAutoresizingMaskIntoConstraints = false
        cursorView.translatesAutoresizingMaskIntoConstraints = false
        planetaDerretendo.translatesAutoresizingMaskIntoConstraints = false
        termometroBase.translatesAutoresizingMaskIntoConstraints = false
        buttonBG.translatesAutoresizingMaskIntoConstraints = false
        
        
        targetPositionY = targetView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70)
        
        targetPositionY!.isActive = true
        
        cursorPositionY = cursorView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70)
        
        cursorPositionY!.isActive = true
        
        
        
        //Botões
        NSLayoutConstraint.activate([
            stopButton.heightAnchor.constraint(equalToConstant: 70),
            stopButton.widthAnchor.constraint(equalToConstant: 70),
            stopButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stopButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonBG.heightAnchor.constraint(equalToConstant: 80),
            buttonBG.widthAnchor.constraint(equalToConstant: 80),
            buttonBG.centerXAnchor.constraint(equalTo: stopButton.centerXAnchor),
            buttonBG.centerYAnchor.constraint(equalTo: stopButton.centerYAnchor)
        ])
        
        //Views
        NSLayoutConstraint.activate([
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            termometroTubo.trailingAnchor.constraint(equalTo: planetaDerretendo.trailingAnchor, constant: -45),
            termometroBase.topAnchor.constraint(equalTo: planetaDerretendo.topAnchor),
            termometroTubo.heightAnchor.constraint(equalToConstant: 203.7),
            termometroTubo.widthAnchor.constraint(equalToConstant: 42),
            termometroBase.widthAnchor.constraint(equalToConstant: 107.05),
            termometroBase.heightAnchor.constraint(equalToConstant: 282.8),
            termometroTubo.topAnchor.constraint(equalTo: termometroBase.topAnchor, constant: 25),
            termometroTubo.centerXAnchor.constraint(equalTo: termometroBase.centerXAnchor, constant: 2),
            planetaDerretendo.centerXAnchor.constraint(equalTo: centerXAnchor),
            planetaDerretendo.centerYAnchor.constraint(equalTo: centerYAnchor),
            planetaDerretendo.widthAnchor.constraint(equalToConstant: 378),
            planetaDerretendo.heightAnchor.constraint(equalToConstant: 378),
            targetView.centerXAnchor.constraint(equalTo: termometroTubo.centerXAnchor),
            targetView.widthAnchor.constraint(equalToConstant: 50),
            targetView.heightAnchor.constraint(equalToConstant: 10),
            cursorView.widthAnchor.constraint(equalToConstant: 60),
            cursorView.heightAnchor.constraint(equalToConstant: 5),
            cursorView.centerXAnchor.constraint(equalTo: termometroTubo.centerXAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration () {
        stopButton.addTarget(self, action: #selector(tappedStop), for: .touchUpInside)
        start()
    }
    
    func start() {
        
        movement?.invalidate()
        
        let targetPosition = Int.random(in: -140...0)
        targetPositionY?.constant = CGFloat(targetPosition)
        
        auxMovement = 1
        
        movement = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(cursorMovement), userInfo: nil, repeats: true)

        
    }
    
    @objc func tappedStop (sender: UIButton) {
        
        guard movement != nil else { return }
        
        movement?.invalidate()
          movement = nil
        if cursorPositionY!.constant >= targetPositionY!.constant - 10 && cursorPositionY!.constant <= targetPositionY!.constant + 10 {
            UserDefaults.standard.set(true, forKey: "termometroWon")
            delegate?.won()
            start()
        }
        else {
            delegate?.lost()
            start()
        }
        
    }
    
    @objc func cursorMovement () {
        
        if auxMovement == 0 {
            cursorPositionY!.constant += 1
            if cursorPositionY!.constant == 0 {
                auxMovement = 1
            }
        }
        else {
            cursorPositionY!.constant -= 1
            if cursorPositionY!.constant == -140 {
                auxMovement = 0
            }
        }
        
    }
   
    
}
