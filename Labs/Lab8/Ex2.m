clear all
clc

cam = CentralCamera('focal', 0.00367, 'pixel', 3.98e-6, 'resolution', [640 480], 'centre', [320 240], 'name', 'mycamera');
P = [-0.02, -0.03, 0.3]'
projection = cam.project(P)
round(projection)