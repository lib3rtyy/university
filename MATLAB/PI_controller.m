%Εισαγωγή των παραμέτρων του συστήματος 
T = 0.01;
w_max = 50;
zeta = 0.6;

% Δημιουργία της συνάρτησης μεταφοράς ανοιχτου βρογχου του PI ελεγκτή με Kp & KI τυχαίους αριθμούς 
G = tf([1], [T 1 0]);
Kp = 3.72;
KI = 36.4;
c = KI/Kp;
Gc = tf([Kp c*Kp], [1 0]);

% Εμφάνηση του Γεωμετρικού τόπου ριζών 
figure
rlocus(G*Gc)

% Δημιουργία της συνάρτησης μεταφοράς κλεστού βρόγχου του PI ελεγκτή
% σύμγωνα με την μέθοδο Feedback
K = 28;
sys = feedback(K*G*Gc, 1, -1);

% Εμφάνιση του Step response
figure
step(sys)
grid on

% Διαδικασία ελέγχου ώστε να δημιουργηθεί η κατάλληλη έξοδος με τα κριτήρια
% που μας δίνονται για την υπερύψωση και τον χρόνο ανώδου
[y,t] = step(sys);
rise_time = t(find(y>=0.9, 1)) - t(find(y>=0.1, 1));
overshoot = (max(y) - 1) * 100;
disp(['Rise time: ' num2str(rise_time) ' s'])
disp(['Overshoot: ' num2str(overshoot) ' %'])

% Ευρεσή κατάλληλων κερδών για τα κριτήρια αυτά και εμφάνιση συνάρτησης
Ke = K;
a = c;
KI = Kp*w_max^2/Ke;
Gc = tf([Ke a*Ke], [1 0]);
sys = feedback(Ke*G*Gc, 1, -1)
[y,t] = step(sys);
rise_time = t(find(y>=0.9, 1)) - t(find(y>=0.1, 1));
overshoot = (max(y) - 1) * 100;
disp(['Rise time: ' num2str(rise_time) ' s'])
disp(['Overshoot: ' num2str(overshoot) ' %'])

% Εύρεση διαγράμματος bode
figure
bode(sys)
grid on
